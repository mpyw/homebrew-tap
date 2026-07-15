class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.9.1"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.9.1/suve_1.9.1_darwin_arm64.tar.gz"
      sha256 "80b09afba2beb639593849a930d1d1a9b745bc37530e688d7bc540441a18b946"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.9.1/suve_1.9.1_darwin_amd64.tar.gz"
      sha256 "aaf76af4d51cfb42232765662ccf64d51ecac4afe177c15e8366826330f5eb95"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.9.1/suve_1.9.1_linux_arm64.tar.gz"
      sha256 "95358d89694ee58db5e6f823bf4bb84df6a5e105affd4a2863bafd881018b72e"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.9.1/suve_1.9.1_linux_amd64.tar.gz"
      sha256 "e2b4fd40cacee9ca67881c6264de60233398657eea37c848e149c6ce85695525"
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
