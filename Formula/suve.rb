class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.10.3"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.10.3/suve_1.10.3_darwin_arm64.tar.gz"
      sha256 "89d2bdb0b9d63726409dcdb113afd11fa6e3f2d80efbcb135b7814b0a8bd7d27"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.10.3/suve_1.10.3_darwin_amd64.tar.gz"
      sha256 "87fe99deea618e2872bbea999e0ca8beac7a6fd88b00135ee3a18b25341142d2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.10.3/suve_1.10.3_linux_arm64.tar.gz"
      sha256 "111a7d16a3a612fc7a1520a8259ab7e1f212ce07e5c7023d19eedd275ae47561"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.10.3/suve_1.10.3_linux_amd64.tar.gz"
      sha256 "dbbd27f9e5964835821ca53a55e88ee83e88b214b34b2b79fbfcd6748bdfcaca"
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
