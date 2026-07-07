class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.4.1"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.4.1/suve_1.4.1_darwin_arm64.tar.gz"
      sha256 "9eb39a79c20e237bbeb69023fa8a02251e5d8465763665bf81b2c901e5e87b48"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.4.1/suve_1.4.1_darwin_amd64.tar.gz"
      sha256 "a03a52575f7606eeba17b1297ced3639e277ca3dbae4e134647691ed5da38584"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.4.1/suve_1.4.1_linux_arm64.tar.gz"
      sha256 "f00ac4ad74ec94f2f5dfdb031bb9d568204f2a45b7e6c348dd2a5890f7be417d"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.4.1/suve_1.4.1_linux_amd64.tar.gz"
      sha256 "649770a66c76a91c50b94f51cb20dcddaa091f29a0e7c658f03fefa47d1c26aa"
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
