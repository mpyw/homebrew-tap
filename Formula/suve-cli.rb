class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.10.3"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.10.3/suve_1.10.3_darwin_arm64.tar.gz"
      sha256 "89d2bdb0b9d63726409dcdb113afd11fa6e3f2d80efbcb135b7814b0a8bd7d27"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.10.3/suve_1.10.3_darwin_amd64.tar.gz"
      sha256 "87fe99deea618e2872bbea999e0ca8beac7a6fd88b00135ee3a18b25341142d2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.10.3/suve-cli_1.10.3_linux_arm64.tar.gz"
      sha256 "1432f1cf4361183fead44aa6667f4cfa53460e9171dae5b2b364c27bbf5cd2f2"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.10.3/suve-cli_1.10.3_linux_amd64.tar.gz"
      sha256 "1250ed498c7a9b2681337b80b9b6f4cdee558ccab09125b6d9b2155327623b72"
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
