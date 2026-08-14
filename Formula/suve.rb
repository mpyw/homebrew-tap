class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.9.3"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.9.3/suve_1.9.3_darwin_arm64.tar.gz"
      sha256 "8c905a4d1b44c6124462146768f0f851a3624d7237e400291f26c5ab7c24bc60"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.9.3/suve_1.9.3_darwin_amd64.tar.gz"
      sha256 "63bf0c79334f29b3306e7f2c0fa9db8d287f7202259b0cd307bf94f03701f225"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.9.3/suve_1.9.3_linux_arm64.tar.gz"
      sha256 "fd44a47f8d01a87976aa51f1eaedbac033af886242d71986be4673c25eec1fd3"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.9.3/suve_1.9.3_linux_amd64.tar.gz"
      sha256 "f2cb5eee86577a96e0fee71e3113554a593494eba3f6dd4658cef911c2ef40a1"
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
