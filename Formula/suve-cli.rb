class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.4.1"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.4.1/suve_1.4.1_darwin_arm64.tar.gz"
      sha256 "9eb39a79c20e237bbeb69023fa8a02251e5d8465763665bf81b2c901e5e87b48"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.4.1/suve_1.4.1_darwin_amd64.tar.gz"
      sha256 "a03a52575f7606eeba17b1297ced3639e277ca3dbae4e134647691ed5da38584"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.4.1/suve-cli_1.4.1_linux_arm64.tar.gz"
      sha256 "2176139f2e37172b5a1d27df919678ce7f1c3868a9d5df22358ffaba280acd9a"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.4.1/suve-cli_1.4.1_linux_amd64.tar.gz"
      sha256 "9d73410f5f9e0c1f2c1b5e4359e56f6ea2576cb3946d0a90189486022547f11f"
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
