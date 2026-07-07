class Suve < Formula
  desc "Git-like CLI/GUI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.3.1"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.3.1/suve_1.3.1_darwin_arm64.tar.gz"
      sha256 "10917010036f2c0a7cb475754ff95a98b5310528cd412e001b102030a122d8ac"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.3.1/suve_1.3.1_darwin_amd64.tar.gz"
      sha256 "2df0f10e47ec845d9a857c55b21cf9e6b974cb78c1232222c9681c12f9977670"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.3.1/suve_1.3.1_linux_arm64.tar.gz"
      sha256 "30cc92fc1e0f3893d3441779f63f44dac4d8384a5c92fe88c7727220379c50da"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.3.1/suve_1.3.1_linux_amd64.tar.gz"
      sha256 "b88dec32213e961df37eae46cc214ff52b262e4d9dc697cd313fd1e784707d77"
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
