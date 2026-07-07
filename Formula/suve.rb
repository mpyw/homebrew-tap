class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.3.3"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.3.3/suve_1.3.3_darwin_arm64.tar.gz"
      sha256 "25ffa6685f053bdeff8fef4cfb2f644b178122620d4ba95eca52ed32ef43c3cf"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.3.3/suve_1.3.3_darwin_amd64.tar.gz"
      sha256 "fa35a17900332741055f7cfb9f7287961a15883636c0578c62e6c5ddedfd0495"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.3.3/suve_1.3.3_linux_arm64.tar.gz"
      sha256 "a46bf5c567a82f6bd9381b4eda4b99b42f9174744e0c39fc7beaec4af7ed893a"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.3.3/suve_1.3.3_linux_amd64.tar.gz"
      sha256 "d0b37cc77efa2ce7d6cda571c10e65c9eafad8568a0e2b9b15619bada1851392"
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
