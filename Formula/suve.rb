class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.8.4"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.8.4/suve_1.8.4_darwin_arm64.tar.gz"
      sha256 "124fff0ed0b300bbe2560b7e202a7c8af68b4e098796516e6402f6038e37a596"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.8.4/suve_1.8.4_darwin_amd64.tar.gz"
      sha256 "0c949f9cf76f1d5b95350e54f495f0ea8c258e1b13d11c8c85c353904e3c5755"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.8.4/suve_1.8.4_linux_arm64.tar.gz"
      sha256 "2d3dbbcc745511a55f60a5c578b53ffe6f693cbd7fc0e5926dc0b17126895183"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.8.4/suve_1.8.4_linux_amd64.tar.gz"
      sha256 "817db1577346176f3363dd253a6da82a320fc0bb6e558d60f125b897f93dc46f"
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
