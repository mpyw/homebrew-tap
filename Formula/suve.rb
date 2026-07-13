class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.9.0"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.9.0/suve_1.9.0_darwin_arm64.tar.gz"
      sha256 "50ff26530896d1a2d4fdeb512be66daef1e7074e8ea6fce230e3f95f9e9e987c"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.9.0/suve_1.9.0_darwin_amd64.tar.gz"
      sha256 "011e9a7b8ea93f61a52e62302e7d60e6933a8c8017936917f364991bdbbafcdd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.9.0/suve_1.9.0_linux_arm64.tar.gz"
      sha256 "d2102e3aaceb1a4b95aff2b726a76f3bdbc53a78dad909c06211cde522be648d"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.9.0/suve_1.9.0_linux_amd64.tar.gz"
      sha256 "3f3ea223bc33365935798bb25891a453d137df7750739f868ea1736b8990d6e2"
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
