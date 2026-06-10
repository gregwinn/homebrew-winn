class Winn < Formula
  desc "A Ruby/Elixir-inspired language that compiles to the BEAM"
  homepage "https://github.com/gregwinn/winn-lang"
  url "https://github.com/gregwinn/winn-lang/archive/refs/tags/v0.9.3.tar.gz"
  sha256 "5ebdf6cf1e10a06b90d816c58cefd75036659e474ed16f75f8be98b02bfa255e"
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
