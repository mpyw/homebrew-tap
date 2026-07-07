class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.3.0"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.3.0/suve_1.3.0_darwin_arm64.tar.gz"
      sha256 "abc85b50eae57b2d57b5309dc1fc315d0256e373c761172442d1d64069899aa2"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.3.0/suve_1.3.0_darwin_amd64.tar.gz"
      sha256 "d97c8ff08ac005052dc2e9abba4a92cb1a15836ffa7f622d13ce5874d5da385f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.3.0/suve_1.3.0_linux_arm64.tar.gz"
      sha256 "6e510496e754dc58e995b62223b3369aa3528ec9d696a97e71344e88f48f572c"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.3.0/suve_1.3.0_linux_amd64.tar.gz"
      sha256 "0d7783f6e4820804c22ea6e42c2a6a5d9b419b4b71b726e741e992ed77ccd1e1"
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
