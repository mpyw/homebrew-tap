class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.4.4"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.4.4/suve_1.4.4_darwin_arm64.tar.gz"
      sha256 "88defbe4d4c9afc33f4049b164c19f13ce11e18a389919b656303835a80d05de"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.4.4/suve_1.4.4_darwin_amd64.tar.gz"
      sha256 "8a7481733b3f73d737d774481e8209ca55486362a51df564db5996bc82e53d4c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.4.4/suve_1.4.4_linux_arm64.tar.gz"
      sha256 "706ea0df63934b14588b296d4b70cde05fac25131632e84b00c8df134bf49fa4"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.4.4/suve_1.4.4_linux_amd64.tar.gz"
      sha256 "efe675a1009e593d8c85fe4abf32deab4853fd39dbc9cccd59e580c845b30c99"
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
