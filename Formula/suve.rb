class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.8.0"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.8.0/suve_1.8.0_darwin_arm64.tar.gz"
      sha256 "ee8c96dbd079e8bb0ab433b2240e6b5c124cee97179737c9c929fb88c6b9fb4b"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.8.0/suve_1.8.0_darwin_amd64.tar.gz"
      sha256 "070fcab81e1507dbce705376c829dab3fad2829f76ede26dc7adb3e861245b73"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.8.0/suve_1.8.0_linux_arm64.tar.gz"
      sha256 "b08a7721c66d8e223330abf33e0028a4c280db3c620f9c4d5533acacfe6e394b"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.8.0/suve_1.8.0_linux_amd64.tar.gz"
      sha256 "f4431b25315ddc056661f7cc0d145e8684cbd035a5018515bb009b932fad550a"
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
