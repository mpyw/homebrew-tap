class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.1.0"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.1.0/suve_1.1.0_darwin_arm64.tar.gz"
      sha256 "728d1c0490099ddbf64c21578af8a116e60c176aa2bb6ccd8eaa39ac3d725414"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.1.0/suve_1.1.0_darwin_amd64.tar.gz"
      sha256 "ff9bd80aad4c08bc491a673a0f7dd812d53c01f190c340a29257afcdc55b50d5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.1.0/suve_1.1.0_linux_arm64.tar.gz"
      sha256 "150f3f328d226a3d4ab7d7457452ab4aa74387afa09a81dba161b2beace52cd2"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.1.0/suve_1.1.0_linux_amd64.tar.gz"
      sha256 "1e92d221fd7d5bfc60c1ff77dded81ef5b27f035f8cda8820d45f1c6111c484d"
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
