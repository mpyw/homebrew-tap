class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.9.4"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.9.4/suve_1.9.4_darwin_arm64.tar.gz"
      sha256 "de9c61f4e489f7d82e87bd07a2bc36409ab34e60b7fb4cacb8cf318de18bcfe3"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.9.4/suve_1.9.4_darwin_amd64.tar.gz"
      sha256 "b3eaf5bcd2b49fc247c78b8dcd212c63616fcd869de23c176ebd47171497c2ee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.9.4/suve_1.9.4_linux_arm64.tar.gz"
      sha256 "607a1c79261e5e65a38f1cb13a79d35b6333a8b135ff3ef78f1d0c174524f765"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.9.4/suve_1.9.4_linux_amd64.tar.gz"
      sha256 "8c214b658b46bc02aea31a4ad794a63464b6a9b34a028db91de7ee5226fe8385"
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
