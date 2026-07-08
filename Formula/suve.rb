class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.4.3"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.4.3/suve_1.4.3_darwin_arm64.tar.gz"
      sha256 "cd92b29a6b0b974fdc7388fc0a818e74a4dccb17e514f5c7dac33875183d4d9b"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.4.3/suve_1.4.3_darwin_amd64.tar.gz"
      sha256 "d78dcb30adf3b462b5cb2d48b1241e707f9efbc69979e9dee9bf18b4471d0c62"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.4.3/suve_1.4.3_linux_arm64.tar.gz"
      sha256 "321f22a23a15f2fd2f573bbfd8023772efe429316719fd106d61931fe7f52037"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.4.3/suve_1.4.3_linux_amd64.tar.gz"
      sha256 "18c2f71d3a57986c4e24c3c1c66a0bbbb445be2e8985ea8ce8d5c13acbe5d30f"
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
