class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "0.7.1"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.7.1/suve_0.7.1_darwin_arm64.tar.gz"
      sha256 "20d6cc2b6f5a8f3e281b7c6f372231366b5a43a7e62de721b4984835482d243e"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.7.1/suve_0.7.1_darwin_amd64.tar.gz"
      sha256 "21f9c2bc3c19d24a28cbc76f0985f7e1e48541945bc1ec52326bf4f8206a2814"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.7.1/suve_0.7.1_linux_arm64.tar.gz"
      sha256 "7c6bdffa27fda022ed7a0995b698b5c6f818de9eb7d25be052f9b5590d79467c"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.7.1/suve_0.7.1_linux_amd64.tar.gz"
      sha256 "7204169cc49e7278f4866465da115822360403c13352e8eede364804dbf79bf6"
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
