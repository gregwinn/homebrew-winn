class Winn < Formula
  desc "A Ruby/Elixir-inspired language that compiles to the BEAM"
  homepage "https://github.com/gregwinn/winn-lang"
  url "https://github.com/gregwinn/winn-lang/archive/refs/tags/v0.9.2.tar.gz"
  sha256 "1a1b99b4cc6a6cc121bfaf728cf8ce1b011d80467223e5e24737952a51545115"
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
