class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.10.1"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.10.1/suve_1.10.1_darwin_arm64.tar.gz"
      sha256 "61c39d9cd22860e4ac99c963c3e2d5aaebbc1ccc666932c2f2fc1cc2cdb3f745"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.10.1/suve_1.10.1_darwin_amd64.tar.gz"
      sha256 "aa85dffa7de9313c23a17d347e4eb822fa9f6ed3ce67363536efea699b2ba83d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.10.1/suve_1.10.1_linux_arm64.tar.gz"
      sha256 "5e1a0a1d491f6fc3cdf5b4ea22caeb9e1ab2c7ce18f8b42ccd16901fbf7b3122"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.10.1/suve_1.10.1_linux_amd64.tar.gz"
      sha256 "0741a463bb8a785a54d3083b9741e83c9ff90800bf0061a2bdd83176a630541b"
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
