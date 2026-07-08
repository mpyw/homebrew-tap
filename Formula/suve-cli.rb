class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.5.0"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.5.0/suve_1.5.0_darwin_arm64.tar.gz"
      sha256 "c91fe5a27ef72056eb4401e2bd9b938d2e9b55a9a5dd2fe71b445f810708907f"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.5.0/suve_1.5.0_darwin_amd64.tar.gz"
      sha256 "955dc5d08951c2142fbfb7ee805ab010181ce26518249359552669cf7a2d77eb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.5.0/suve-cli_1.5.0_linux_arm64.tar.gz"
      sha256 "f0095650d08a875bc0af83cc695f824efa7819f04a131bd0c3d86fefb55f44db"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.5.0/suve-cli_1.5.0_linux_amd64.tar.gz"
      sha256 "b87c947cdab2e9786d88622e0d060deacc8ac95fde71af2e3740bc0b97ed9c7b"
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
