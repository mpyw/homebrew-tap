class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.4.2"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.4.2/suve_1.4.2_darwin_arm64.tar.gz"
      sha256 "392916732ebfe0d51b2cb66d068ead5af4aa4f3beb26eb2687f2f891245ffe45"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.4.2/suve_1.4.2_darwin_amd64.tar.gz"
      sha256 "497b3d74d42333da9420131df7eed5f2904b730b8ad7a7f0ffb4e8234e8bd38f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.4.2/suve_1.4.2_linux_arm64.tar.gz"
      sha256 "ebd69382cc045622418a1436b9b8740d51ccb1aaf422162b7a8c6e2005947ae1"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.4.2/suve_1.4.2_linux_amd64.tar.gz"
      sha256 "5e9e444958c8a8ab8e154786cb5ebec43b3559e405c002a689101117696b0310"
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
