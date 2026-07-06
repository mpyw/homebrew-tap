class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.0.0/suve_1.0.0_darwin_arm64.tar.gz"
      sha256 "f4d44ff11cbad77622d62095c430bdb331d25d6cfdf9de0689a0d83fdd4524b3"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.0.0/suve_1.0.0_darwin_amd64.tar.gz"
      sha256 "2b439a2476e4a444b2b8d83943f6250075c002ef85c79500d2f19562542e77c9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.0.0/suve_1.0.0_linux_arm64.tar.gz"
      sha256 "d7a79d6e59272a850333b2d82158480df8c13eee1ad9c00f87845951a64b892c"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.0.0/suve_1.0.0_linux_amd64.tar.gz"
      sha256 "1b067ade9e573eaa2f00bb6a66e12470fb8d10b4cae4b386a7cf552d5f9bb0cc"
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
