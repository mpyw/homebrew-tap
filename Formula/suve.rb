class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "0.6.1"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.6.1/suve_0.6.1_darwin_arm64.tar.gz"
      sha256 "a9a0916480a7608f54ddc1b88bed6f89108577336974eb30311befc128074581"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.6.1/suve_0.6.1_darwin_amd64.tar.gz"
      sha256 "7c05b2bce4e8ef2ebcd28316ba635c07383cea4fde723592e6fabf1be7742840"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.6.1/suve_0.6.1_linux_arm64.tar.gz"
      sha256 "b99da49b640ca4638750d3af8beb5d164883b88ff19b02df5a2bd97054366dea"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.6.1/suve_0.6.1_linux_amd64.tar.gz"
      sha256 "4e31d35357a8b68f0e08f87e9c2551bddb6d68b764f562c48e5d692a2c8ab1a4"
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
