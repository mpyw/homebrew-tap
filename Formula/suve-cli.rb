class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.4.3"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.4.3/suve_1.4.3_darwin_arm64.tar.gz"
      sha256 "cd92b29a6b0b974fdc7388fc0a818e74a4dccb17e514f5c7dac33875183d4d9b"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.4.3/suve_1.4.3_darwin_amd64.tar.gz"
      sha256 "d78dcb30adf3b462b5cb2d48b1241e707f9efbc69979e9dee9bf18b4471d0c62"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.4.3/suve-cli_1.4.3_linux_arm64.tar.gz"
      sha256 "b636f45ee0e58f3336023d68b4c963e053cd08dc19020255c046c8208215cd44"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.4.3/suve-cli_1.4.3_linux_amd64.tar.gz"
      sha256 "e9c1b7447445284b7e2d986397d5ec583cc192dc6e632645a574e0aa0a48e200"
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
