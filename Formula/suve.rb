class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "0.7.2"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.7.2/suve_0.7.2_darwin_arm64.tar.gz"
      sha256 "7d8313ff1166ba81bc261b849b62c89cf9e10c2c1d5c10d6028770bf8f4b5a76"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.7.2/suve_0.7.2_darwin_amd64.tar.gz"
      sha256 "8f7139e761a82ea84f0e2329dc8224a2ac5c602aa0c26a3055be6644233157ee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.7.2/suve_0.7.2_linux_arm64.tar.gz"
      sha256 "72fb33de6a60abb472d0fdc4fda9bd46d11ad4225946ba06a18e834137c6aa26"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.7.2/suve_0.7.2_linux_amd64.tar.gz"
      sha256 "ee43a6569f5dcdabeb7cc5cf81f5e997d53d93a39a4e37c98241de05f68ff6b9"
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
