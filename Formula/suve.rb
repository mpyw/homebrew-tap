class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.4.5"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.4.5/suve_1.4.5_darwin_arm64.tar.gz"
      sha256 "a899e5dc0fcbef118315ba1beacf9d2dd6807a5b6c32ba26aec95bf9eba1caa8"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.4.5/suve_1.4.5_darwin_amd64.tar.gz"
      sha256 "29ab3d796294ef9c5484f04674e8019fde6c24507872469f292a1f24fb5a0282"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.4.5/suve_1.4.5_linux_arm64.tar.gz"
      sha256 "8eda80373341a789b69e4b2520f0ba4e77c8552313cf47a9d79798716d918a58"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.4.5/suve_1.4.5_linux_amd64.tar.gz"
      sha256 "b47432426600da38a972d4c2f9102151e519b4490860b095dd38ef63fe802bc1"
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
