class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "0.6.4"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.6.4/suve_0.6.4_darwin_arm64.tar.gz"
      sha256 "480e904a1f33fcfe18172384d1413334610a3825c050928d42d1c18fec00bbe5"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.6.4/suve_0.6.4_darwin_amd64.tar.gz"
      sha256 "45db002acff5bcbe6090473232fadca8ca17eb4930cb8d9b4d13431562b224f7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.6.4/suve_0.6.4_linux_arm64.tar.gz"
      sha256 "da74b374dc97751baa5e66dd4716d1992678a775847a7ad482f7814321a7bde4"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.6.4/suve_0.6.4_linux_amd64.tar.gz"
      sha256 "62865824db23682827c11ac375ec339fe42f52eabff0f6a800d04872cb239cfd"
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
