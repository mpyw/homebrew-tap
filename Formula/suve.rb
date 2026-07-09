class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.6.0"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.6.0/suve_1.6.0_darwin_arm64.tar.gz"
      sha256 "a2cd8ca5add72e9ce8726c20d13848b85383fcbf9570301ba2356b5d3306e0e2"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.6.0/suve_1.6.0_darwin_amd64.tar.gz"
      sha256 "541bf49d7d5e6276575fa72ae4744a00252fbc36713d3ef71961ae5908d8c7c7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.6.0/suve_1.6.0_linux_arm64.tar.gz"
      sha256 "a56729b9c6fab17d2d48a0bc5c8c22f5527f0143c6be3fa9a986878caf10e377"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.6.0/suve_1.6.0_linux_amd64.tar.gz"
      sha256 "0fd7c450e41b7a7cd9412a20fda1732644992687a367f4f87503e6801507a330"
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
