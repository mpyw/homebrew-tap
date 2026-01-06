class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "0.6.3"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.6.3/suve_0.6.3_darwin_arm64.tar.gz"
      sha256 "2f5ec36c0f2effe6a1fa0de3efd87c737ac69d43d139af32c39bf9e48922dbcd"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.6.3/suve_0.6.3_darwin_amd64.tar.gz"
      sha256 "2c302c0896690394b3855f67928bd01538dd21ff333decb198d7bd48eed5422c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.6.3/suve_0.6.3_linux_arm64.tar.gz"
      sha256 "176632664b8df59cd48f6e4b3461391497caffade3e94b208fed2d86cc56b54c"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.6.3/suve_0.6.3_linux_amd64.tar.gz"
      sha256 "b082f13149ce2fb2d41ab2ade1fafd9241dfee4334c8276c039f7d73fe91bcd4"
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
