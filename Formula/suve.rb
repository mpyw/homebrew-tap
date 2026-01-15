class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "0.7.4"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.7.4/suve_0.7.4_darwin_arm64.tar.gz"
      sha256 "45b5de52dc90c86ce3cbc6b6caf8835f0d27bd12de4a113755b443132b08f037"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.7.4/suve_0.7.4_darwin_amd64.tar.gz"
      sha256 "2fe3ed544af1e081eee4df817005750ca5632ef98f9f51a5d6ee88e9191f6563"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.7.4/suve_0.7.4_linux_arm64.tar.gz"
      sha256 "dcf2999296bd2fbe3766e036479dd62a5913fc8c5a4ddae9ad9ca3a7a1e35b4b"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.7.4/suve_0.7.4_linux_amd64.tar.gz"
      sha256 "436d4b7d43ce0e35eb934b37fed13af40d6b1e55dbabde545f270dc243428d2f"
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
