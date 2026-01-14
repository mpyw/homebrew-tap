class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "0.7.0"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.7.0/suve_0.7.0_darwin_arm64.tar.gz"
      sha256 "67f12dea1f770857cc3aea5540972972ddd4863296223de2032da6d9a2488c32"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.7.0/suve_0.7.0_darwin_amd64.tar.gz"
      sha256 "481dc6f56e2b66bc33238e95d9ce78fcd6811ca5d31e86a83c24cdb2e1a2c04e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.7.0/suve_0.7.0_linux_arm64.tar.gz"
      sha256 "20c4f6075d8297e52ff7afeb1891094d50de7b02a64d57c86178c7ea0712d4d9"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.7.0/suve_0.7.0_linux_amd64.tar.gz"
      sha256 "d32f9d8f30263988b209e1646b4ac7cc64a67e89fea284c25bb01ad54a6f67d7"
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
