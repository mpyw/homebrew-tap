class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "0.7.5"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.7.5/suve_0.7.5_darwin_arm64.tar.gz"
      sha256 "91f651ded6699fd997cc6552f93c3d500c007e5bca9e1cd9c20a0df63dc105e5"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.7.5/suve_0.7.5_darwin_amd64.tar.gz"
      sha256 "1745504eb5bf0d319b2a90b6f9522ca3dbcd7c30064a315f9621fb64d9ea3dcb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.7.5/suve_0.7.5_linux_arm64.tar.gz"
      sha256 "7bf030416b78f221e2877b2893f92bd5474e440d9694fd780c661f63e78f3cfe"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.7.5/suve_0.7.5_linux_amd64.tar.gz"
      sha256 "7e0259c3108680e74c8ebc8cc617eb33a46a2867ceeedfb67e674b0ab4ee83fa"
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
