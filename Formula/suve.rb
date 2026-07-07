class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.4.0"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.4.0/suve_1.4.0_darwin_arm64.tar.gz"
      sha256 "07dd6e1321c340efc4fc5438ff7cea3dedeee00f2b0db256fa32075068d9973f"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.4.0/suve_1.4.0_darwin_amd64.tar.gz"
      sha256 "264e9f1e9d54f1f3f5c5cea705e3b7816485d14c249f69351c09871806840e6e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.4.0/suve_1.4.0_linux_arm64.tar.gz"
      sha256 "f375790b06806343176de4fc54aa1a4981ae8f54943ddca726870939a2aea5e2"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.4.0/suve_1.4.0_linux_amd64.tar.gz"
      sha256 "13866cf9f02f301e421403cef6064ab2e52722752a4b4c4149ee7b9efdd7f72f"
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
