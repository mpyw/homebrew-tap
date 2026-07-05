class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "0.8.1"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.8.1/suve_0.8.1_darwin_arm64.tar.gz"
      sha256 "f253d46d52bc06b6a67fba3ee6d23b6996ab9b372970a7d13bee1e026e9e2dfc"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.8.1/suve_0.8.1_darwin_amd64.tar.gz"
      sha256 "9a87b523d506c170921fb20f1b7a101f20c08afeb36a2d5ed714db773538c89e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.8.1/suve_0.8.1_linux_arm64.tar.gz"
      sha256 "98ba057dd84ea8244a12f11289c74bf0a431a15d6790a98eef0c3b2c65665878"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.8.1/suve_0.8.1_linux_amd64.tar.gz"
      sha256 "65167520a152a1e9cc113496114dd98180c9ab9fd6de993eab9b182462a84a06"
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
