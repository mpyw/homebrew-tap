class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "0.7.6"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.7.6/suve_0.7.6_darwin_arm64.tar.gz"
      sha256 "a234c23a8167f1e295c9de846d605881ad9b9d70b1eaa2c0769f013fa9936a58"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.7.6/suve_0.7.6_darwin_amd64.tar.gz"
      sha256 "a377a75a444948beb5ec5cc4e78de4269abb10668715519ab7b450df636ef23b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.7.6/suve_0.7.6_linux_arm64.tar.gz"
      sha256 "92a0eae9eff2f1121a3ad980674dab5128e94e88fbb3aa9d3969d277872d8553"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.7.6/suve_0.7.6_linux_amd64.tar.gz"
      sha256 "2c9d357ab1727b39732da67f85cf82de3ac2b306a55b68c09a770b75e5bc9177"
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
