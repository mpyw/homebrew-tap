class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.7.0"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.7.0/suve_1.7.0_darwin_arm64.tar.gz"
      sha256 "b70928456527d8fbd5cf130cb569df057a2f97cb89bd699fcf3140914d786cc0"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.7.0/suve_1.7.0_darwin_amd64.tar.gz"
      sha256 "d887b7a965403549a2267420fc163d35412cc734907872f59fb264adb2ba8ec2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.7.0/suve_1.7.0_linux_arm64.tar.gz"
      sha256 "422bcc994607b11eb85a3a872239b55b347fdf0a737ceaa1a220ab2290ccc29e"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.7.0/suve_1.7.0_linux_amd64.tar.gz"
      sha256 "b8d93062d7162717e1898914802a6d473bee5639c9a629216266eef31e5495c5"
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
