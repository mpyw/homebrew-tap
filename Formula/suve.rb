class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.5.2"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.5.2/suve_1.5.2_darwin_arm64.tar.gz"
      sha256 "e6eb90d94d9e67dd2d0fc927f0fd8fb7d435840b60d248eb3b02379d09ac9cfb"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.5.2/suve_1.5.2_darwin_amd64.tar.gz"
      sha256 "a43d4cb5af4fc80f4e520886c289d777ccb0bd9001a0ecbfe25f00168ab83630"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.5.2/suve_1.5.2_linux_arm64.tar.gz"
      sha256 "f346ff8be1ca8523e41dcda663208ebbc6781dac81db1f3bd484860fbc5e1e28"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.5.2/suve_1.5.2_linux_amd64.tar.gz"
      sha256 "a306506c73b1f3da71bcf2233dd80c8c89d66ba1ff13786e3edd27da334422dc"
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
