class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "0.6.5"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.6.5/suve_0.6.5_darwin_arm64.tar.gz"
      sha256 "e8749d8de890830e14743cc237a9ccf99a612f7bd1b5e4246a6229258f1b560a"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.6.5/suve_0.6.5_darwin_amd64.tar.gz"
      sha256 "f4db3c4244df66f37788a8478bb27c3cdf0c8a1083b59e1d5fa01d0c44e0b0c2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.6.5/suve_0.6.5_linux_arm64.tar.gz"
      sha256 "b48df663d32243c01d150dede5edb3815e923fbcf8a52e34e1948192b780d058"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.6.5/suve_0.6.5_linux_amd64.tar.gz"
      sha256 "d8cfc3ef97fa76268684ae0dbde9b9b5b1fe5519b2df41a728aa31733f82d669"
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
