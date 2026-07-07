class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.1.1"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.1.1/suve_1.1.1_darwin_arm64.tar.gz"
      sha256 "b7c993bb2e07c131cd7d5b50219eb55e507482558dc88c360042a6ce6fb25513"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.1.1/suve_1.1.1_darwin_amd64.tar.gz"
      sha256 "195ddfc7280ea6b87c284854e7edc2904b90892c50de31f0dd96284f8f1739ec"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.1.1/suve_1.1.1_linux_arm64.tar.gz"
      sha256 "4a841f599366a0b8cd7efce41f60fd5eaa07a93cb22c4593c12b7f5749952e10"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.1.1/suve_1.1.1_linux_amd64.tar.gz"
      sha256 "b81e7502433c6acf143bd5320d6c2449678b2152f4b9c1df106b633fb2119591"
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
