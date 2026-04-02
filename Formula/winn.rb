class Winn < Formula
  desc "A Ruby/Elixir-inspired language that compiles to the BEAM"
  homepage "https://github.com/gregwinn/winn-lang"
  url "https://github.com/gregwinn/winn-lang/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "b270d3aa778850c41e9f98ac7925130c069cac5ada0153982d98907de4585f2d"
  license "MIT"
  depends_on "erlang"
  depends_on "rebar3"
  def install
    system "rebar3", "escriptize"
    bin.install "_build/default/bin/winn"
  end
  test do
    assert_match "Winn - a compiled language", shell_output("#{bin}/winn help")
    (testpath/"hello.winn").write <<~EOS
      module Hello
        def main()
          IO.puts("Hello from Winn!")
        end
      end
    EOS
    system "#{bin}/winn", "run", "hello.winn"
  end
end
