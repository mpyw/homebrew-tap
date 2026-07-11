class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.8.1"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.8.1/suve_1.8.1_darwin_arm64.tar.gz"
      sha256 "0a60624e53608c814100327edbb26c05e40e9bf49a5cf098aff4376b59e481be"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.8.1/suve_1.8.1_darwin_amd64.tar.gz"
      sha256 "3fd7bd1920891ae28d3ec37995e3c8aa15c6aec4bf97744672947a6751da5237"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.8.1/suve-cli_1.8.1_linux_arm64.tar.gz"
      sha256 "2109b6b88d45897333a3da70d3caa22688a2b9172e799ea7e78f22b1649228dd"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.8.1/suve-cli_1.8.1_linux_amd64.tar.gz"
      sha256 "8368dfca31d99169957896c0a8ed9291336b01632ba957a9053bede092d95685"
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
