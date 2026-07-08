class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.4.6"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.4.6/suve_1.4.6_darwin_arm64.tar.gz"
      sha256 "0bdbf2d22dc524766e81c79d9679b1bdfa4d489d444de84b546a342cb6209c39"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.4.6/suve_1.4.6_darwin_amd64.tar.gz"
      sha256 "65beb25c1f08946549c8530b04552459784c94fd9b2b8cdd712548637d4ec56a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.4.6/suve_1.4.6_linux_arm64.tar.gz"
      sha256 "0e4cbe2d16376e8643632f03d3309b207accaa5bc033c9b882f41127652f8148"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.4.6/suve_1.4.6_linux_amd64.tar.gz"
      sha256 "0448004c023460e6c30df49c3de37cebc9851b287d9be2e4f7c48fbe6534b98c"
    end

    depends_on "gtk+3"
    depends_on "webkitgtk"
  end

  conflicts_with "suve-cli", because: "both install a `suve` binary"

  def install
    bin.install "suve"
  end

  def caveats
    on_linux do
      <<~EOS
        This formula installs the GUI version which requires GTK3 and WebKit2GTK.
        If you only need CLI functionality, install suve-cli instead:
          brew install mpyw/tap/suve-cli
      EOS
    end
  end

  test do
    system bin/"suve", "--version"
  end
end
