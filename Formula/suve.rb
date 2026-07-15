class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.9.2"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.9.2/suve_1.9.2_darwin_arm64.tar.gz"
      sha256 "936ccd2dc5d0b998b767fb061631b457ffe9187b6670d432f414178f949c258e"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.9.2/suve_1.9.2_darwin_amd64.tar.gz"
      sha256 "22b138033987cd6870f5a0f41eb026ee97781bcf54db078acb21974d106dc112"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.9.2/suve_1.9.2_linux_arm64.tar.gz"
      sha256 "d305452189c1145bb7517b5127f1141f3c9c96f3982d29d9162262ffbc83b0cd"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.9.2/suve_1.9.2_linux_amd64.tar.gz"
      sha256 "e156df107e2a1bf7ba86054e9b0aef24f555d4cf0eec51512a8d9587bea2a452"
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
