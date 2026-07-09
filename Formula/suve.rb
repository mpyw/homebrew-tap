class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.6.1"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.6.1/suve_1.6.1_darwin_arm64.tar.gz"
      sha256 "4dc415b9e89fe0e5a2c008a35b1d346eac402cf6781b9f918aa3ede768a13afc"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.6.1/suve_1.6.1_darwin_amd64.tar.gz"
      sha256 "1812938256aa7286244de87a72111d6bb99c9e0cd31015e4489c589e715372df"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.6.1/suve_1.6.1_linux_arm64.tar.gz"
      sha256 "b920a558ff0aabc24131a21858046fc2bdb7dff03b1fe8d113b15cd0ba114b03"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.6.1/suve_1.6.1_linux_amd64.tar.gz"
      sha256 "d3a41b938b07ce6eef11f403312103bae8e9a46680652e9ca2ca802db776c7f5"
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
