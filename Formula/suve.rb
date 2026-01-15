class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "0.7.3"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.7.3/suve_0.7.3_darwin_arm64.tar.gz"
      sha256 "23b2207501e068e93a908b21377231580c28c4390ae1b154d0b998f8e5e9b7a9"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.7.3/suve_0.7.3_darwin_amd64.tar.gz"
      sha256 "9f41672e57bbc0c4eb93d39ec0177d9b17b10c90fdb5aa00f7f39b7c10342165"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.7.3/suve_0.7.3_linux_arm64.tar.gz"
      sha256 "2b0bd67e5a4686c8063565a2c73f9120f5f2a92a3e7b955b63c1d36ed429eba9"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.7.3/suve_0.7.3_linux_amd64.tar.gz"
      sha256 "83ff407459ad561027d3d90554be48d65a9718ff28d4376d942ad56bb8768e0f"
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
