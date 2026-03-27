class Winn < Formula
  desc "A Ruby/Elixir-inspired language that compiles to the BEAM"
  homepage "https://github.com/gregwinn/winn-lang"
  url "https://github.com/gregwinn/winn-lang/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "3d1cf040e6c61c0e4613bd99bb5fa4e7117f45ac29f35e712e218e2e2a3dac9a"
  license "MIT"

  depends_on "erlang"
  depends_on "rebar3"

  def install
    system "rebar3", "escriptize"
    bin.install "_build/default/bin/winn"
  end

  test do
    # Verify the CLI runs
    assert_match "Winn - a compiled language", shell_output("#{bin}/winn help")

    # Verify compilation works
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
