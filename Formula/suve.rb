class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.8.5"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.8.5/suve_1.8.5_darwin_arm64.tar.gz"
      sha256 "5d43fb2ec05ffb993c3b5132d2dff9f69b2754097c577dd267e3938a039f4f93"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.8.5/suve_1.8.5_darwin_amd64.tar.gz"
      sha256 "f61c401f6be1baf87e6ed14c4e3f058431c114721db025902184f777e837426f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.8.5/suve_1.8.5_linux_arm64.tar.gz"
      sha256 "65fb0351fbc66e2160c654c1227a790986fb113bf9fc242b614bcc73518fa682"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.8.5/suve_1.8.5_linux_amd64.tar.gz"
      sha256 "8fac9b102705e3896f8899af04d0d230bfbb28f2cfd4966944a9fb3ca08404fc"
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
