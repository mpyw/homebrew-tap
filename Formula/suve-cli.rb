class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "0.7.2"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.7.2/suve_0.7.2_darwin_arm64.tar.gz"
      sha256 "7d8313ff1166ba81bc261b849b62c89cf9e10c2c1d5c10d6028770bf8f4b5a76"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.7.2/suve_0.7.2_darwin_amd64.tar.gz"
      sha256 "8f7139e761a82ea84f0e2329dc8224a2ac5c602aa0c26a3055be6644233157ee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.7.2/suve-cli_0.7.2_linux_arm64.tar.gz"
      sha256 "5613d3e2309cd6f376a2e95790bf2487cc51a3eb812dab4b17a0670c6dc51b42"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.7.2/suve-cli_0.7.2_linux_amd64.tar.gz"
      sha256 "92a9e74c1307e94069d1b819aae69f8c46cdeb8e2adf535377ad585243f61b7e"
    end
  end

  conflicts_with "suve", because: "both install a `suve` binary"

  def install
    # Linux uses CLI-only binary (named suve-cli), macOS uses full binary (named suve)
    if File.exist?("suve-cli")
      bin.install "suve-cli" => "suve"
    else
      bin.install "suve"
    end
  end

  test do
    system bin/"suve", "--version"
  end
end
