class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.9.5"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.9.5/suve_1.9.5_darwin_arm64.tar.gz"
      sha256 "21e0a4c2af7d11e7e22f08eeb9c0e3b55b1819f9bc6ef01253d4dbc809493f8d"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.9.5/suve_1.9.5_darwin_amd64.tar.gz"
      sha256 "8aac16606549c11676f719838061468ce3826b062c51cb8af9452adef3da5f4a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.9.5/suve_1.9.5_linux_arm64.tar.gz"
      sha256 "817c3e1dc9f4abd5b2c5f2465a01f1474e3f0964085132d798edb78b949b9bf7"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.9.5/suve_1.9.5_linux_amd64.tar.gz"
      sha256 "299469f2b16dc067ddecbbc8816b7f2cd391019e9ac6219aea7ab5cd27a7080c"
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
