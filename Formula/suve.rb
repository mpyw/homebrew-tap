class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.8.2"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.8.2/suve_1.8.2_darwin_arm64.tar.gz"
      sha256 "27d419c2d0a79d21a8205887db35ede75b36a556ba8ca32de3ef97432bc3cb37"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.8.2/suve_1.8.2_darwin_amd64.tar.gz"
      sha256 "f7352f57ed9a382073b9cace4333f303a4ff8dbe92fc05af087e7733314f6088"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.8.2/suve_1.8.2_linux_arm64.tar.gz"
      sha256 "85f2a4edbd47384e5616d1b2e08cbf7bb20550f2d8c80f569e923fb2e6dafaf7"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.8.2/suve_1.8.2_linux_amd64.tar.gz"
      sha256 "ecb7f7fb675a7d2dd1444fcb5f418fa7e84f995cb2d64b728df9c692c1ee7129"
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
