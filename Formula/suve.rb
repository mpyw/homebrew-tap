class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.10.0"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.10.0/suve_1.10.0_darwin_arm64.tar.gz"
      sha256 "746bf82476995a608d718bc227179711380b9dd0a26b148c27770c1c96c09e5d"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.10.0/suve_1.10.0_darwin_amd64.tar.gz"
      sha256 "de3079c3e795fda352499586190439aaef9eda5f3156ff197d188ca5a4fd3513"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.10.0/suve_1.10.0_linux_arm64.tar.gz"
      sha256 "d3015c186811366b8c856dce2428c25f07949ee1e25ba2d642872fd0e97ee419"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.10.0/suve_1.10.0_linux_amd64.tar.gz"
      sha256 "764a7ad6d40a6fee146d860eec07af37279ae961be554c66e73ca6072c255ded"
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
