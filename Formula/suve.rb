class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.8.3"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.8.3/suve_1.8.3_darwin_arm64.tar.gz"
      sha256 "0d8ca03791d7e4c1495dbd07430cd48a37180c9f1646be5ec5301d1cf30609d4"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.8.3/suve_1.8.3_darwin_amd64.tar.gz"
      sha256 "c79fa4c2a2e22b956ae55002fde8007e5d5fc65bcec433cb9b6062f73cba77d9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.8.3/suve_1.8.3_linux_arm64.tar.gz"
      sha256 "48cab01b01090f5c3872a2807a6c33fc71d5a6eb09f8b8da73ca599da9f93ab0"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.8.3/suve_1.8.3_linux_amd64.tar.gz"
      sha256 "e0a6315f664e397744de55095ff3a3cef505475b902d09739444db45dd92928f"
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
