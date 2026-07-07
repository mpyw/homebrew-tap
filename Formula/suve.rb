class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.3.2"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.3.2/suve_1.3.2_darwin_arm64.tar.gz"
      sha256 "4307138572bbb1ca10f745e1cdb4fc16a6f2f14730f6afad9fca6195d2f36e32"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.3.2/suve_1.3.2_darwin_amd64.tar.gz"
      sha256 "d105b3105ae7eea95c19df12d312e8f8f22cc319e7e9a812d96df61ef054d524"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.3.2/suve_1.3.2_linux_arm64.tar.gz"
      sha256 "36ad7efe2132f788ba6d815e528947406a879b3d4b05d1ba16ccab82f1afdf3d"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.3.2/suve_1.3.2_linux_amd64.tar.gz"
      sha256 "b09eca70a6cd227ea5b8d0ddcee6491f07f1e05db4f6f85144099dd7a7141fce"
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
