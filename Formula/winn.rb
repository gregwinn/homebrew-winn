class Winn < Formula
  desc "A Ruby/Elixir-inspired language that compiles to the BEAM"
  homepage "https://github.com/gregwinn/winn-lang"
  url "https://github.com/gregwinn/winn-lang/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "6ba548bf0abdcb688f8dcb51aaf0bc9eb4894c4bc000458b973c9646b1850bb5"
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
