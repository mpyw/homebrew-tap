class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.10.2"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.10.2/suve_1.10.2_darwin_arm64.tar.gz"
      sha256 "89049ebf9e4b39bf06cd12865ca156743aab477e5975f7aab655de34bd8256ae"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.10.2/suve_1.10.2_darwin_amd64.tar.gz"
      sha256 "d9a3750af8125be00378770bc43062bfce159a1a30977c3cb88a47a6e57fff98"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.10.2/suve_1.10.2_linux_arm64.tar.gz"
      sha256 "858ba49b2b93a2af10ba7ffe669fd1097192c034b6aec9160ee7e74c30d74dc1"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.10.2/suve_1.10.2_linux_amd64.tar.gz"
      sha256 "758a0557d95d7d6421d68a95e61db94da6c0de7c61e7af9cb77ef182f85f879f"
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
