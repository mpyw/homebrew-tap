class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.5.0"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.5.0/suve_1.5.0_darwin_arm64.tar.gz"
      sha256 "c91fe5a27ef72056eb4401e2bd9b938d2e9b55a9a5dd2fe71b445f810708907f"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.5.0/suve_1.5.0_darwin_amd64.tar.gz"
      sha256 "955dc5d08951c2142fbfb7ee805ab010181ce26518249359552669cf7a2d77eb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.5.0/suve_1.5.0_linux_arm64.tar.gz"
      sha256 "4aaacda3413305b91542a98e0fe7ceac5d32e083eb0137b13f832d23b896f8d1"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.5.0/suve_1.5.0_linux_amd64.tar.gz"
      sha256 "5e93dfebecca1f34e9bfee90664db78d2b249aaffbfd517aac8a3abffde97a2b"
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
