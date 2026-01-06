class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "0.6.0"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.6.0/suve_0.6.0_darwin_arm64.tar.gz"
      sha256 "5d0895034c3bac5bae765b11a431bf7a59bf0a93ef5d62cd318e858e18980478"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.6.0/suve_0.6.0_darwin_amd64.tar.gz"
      sha256 "cf1b0224914801b6284a6498ab2c410d8e2f5a5968ef1ea626ccf4d1f310a9b4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.6.0/suve_0.6.0_linux_arm64.tar.gz"
      sha256 "7f4da596e43741966d03cf029a5ead78bd6f54986ed08c73f8d365e9735025eb"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.6.0/suve_0.6.0_linux_amd64.tar.gz"
      sha256 "7ac250b23087215a5fe634b5470c57de16619bcde63cfc6ec771d43fd2f14a2f"
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
