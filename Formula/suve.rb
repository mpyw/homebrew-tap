class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.5.1"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.5.1/suve_1.5.1_darwin_arm64.tar.gz"
      sha256 "a05262e1e6c4ff74aa4e705fd8d6acd796272c30090eacffb1348975dd8ab487"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.5.1/suve_1.5.1_darwin_amd64.tar.gz"
      sha256 "134784eab6b125da1ea240abaa33fd88ccbdcc9b190f4c84b9aee3749fae9bd6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.5.1/suve_1.5.1_linux_arm64.tar.gz"
      sha256 "3aac03d19b72606f7077c2d7d586f6d445eb9ce178939b49816347edefb24ab9"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.5.1/suve_1.5.1_linux_amd64.tar.gz"
      sha256 "be4acc911fcc6c2098b703b80e68b00d283fcb85745b84311f9e0ec7577045d7"
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
