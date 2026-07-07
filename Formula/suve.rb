class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.2.0"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.2.0/suve_1.2.0_darwin_arm64.tar.gz"
      sha256 "6d5b2f68328e0fb2651d487bef819080408241296d0cb3461bf84cc89cfa257a"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.2.0/suve_1.2.0_darwin_amd64.tar.gz"
      sha256 "a7a14a7721d5e8fccf727d5f995819eac5d7471a153541d925e29b2547a57c92"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.2.0/suve_1.2.0_linux_arm64.tar.gz"
      sha256 "016eae2b52fdf3ac5d128ddbaa86e08c9e22eecac6da33590cf71137d3f73626"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.2.0/suve_1.2.0_linux_amd64.tar.gz"
      sha256 "fb1b76a96e0155ea1ed6137f2eff71718d2aa7504e99b5427ea4867e4f570f7a"
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
