class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.8.1"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.8.1/suve_1.8.1_darwin_arm64.tar.gz"
      sha256 "0a60624e53608c814100327edbb26c05e40e9bf49a5cf098aff4376b59e481be"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.8.1/suve_1.8.1_darwin_amd64.tar.gz"
      sha256 "3fd7bd1920891ae28d3ec37995e3c8aa15c6aec4bf97744672947a6751da5237"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.8.1/suve_1.8.1_linux_arm64.tar.gz"
      sha256 "c734850041d04d0e53d5f47811a011b5e5d9e4d354f7ef8137a04a7a6d542a82"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.8.1/suve_1.8.1_linux_amd64.tar.gz"
      sha256 "65a0a088c4b62246dab2926fa5e3430074655b0272df31b1433531dfc035ee69"
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
