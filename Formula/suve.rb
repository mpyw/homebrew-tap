class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "0.8.0"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.8.0/suve_0.8.0_darwin_arm64.tar.gz"
      sha256 "62c1b5414c79982407c0084502a6d661ba20aece6c6590ca8afffbad4af4ef03"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.8.0/suve_0.8.0_darwin_amd64.tar.gz"
      sha256 "eb222df4ecaf25ebccc4703855843249fb1b15674682fbe4082fe89c3165f1f8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.8.0/suve_0.8.0_linux_arm64.tar.gz"
      sha256 "7928c910a38dfd538f2fd66e8388b972bb2b12b8a50951f0696bcccec92cf555"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.8.0/suve_0.8.0_linux_amd64.tar.gz"
      sha256 "516367546ceb800eb065f8903507371c5bf93eb3f9f8a21ffc8d54014f5e156a"
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
