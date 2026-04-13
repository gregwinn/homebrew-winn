class Winn < Formula
  desc "A Ruby/Elixir-inspired language that compiles to the BEAM"
  homepage "https://github.com/gregwinn/winn-lang"
  url "https://github.com/gregwinn/winn-lang/archive/refs/tags/v0.9.1.tar.gz"
  sha256 "a7c99f0501947b1c4d45b8176db28a465bb47f8a2e795fc4465bced4d7a48162"
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
