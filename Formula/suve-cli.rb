class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.9.1"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.9.1/suve_1.9.1_darwin_arm64.tar.gz"
      sha256 "80b09afba2beb639593849a930d1d1a9b745bc37530e688d7bc540441a18b946"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.9.1/suve_1.9.1_darwin_amd64.tar.gz"
      sha256 "aaf76af4d51cfb42232765662ccf64d51ecac4afe177c15e8366826330f5eb95"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.9.1/suve-cli_1.9.1_linux_arm64.tar.gz"
      sha256 "2951bbafa92ff40d76732e725d6c7d03d9985628073c54350340c9cec0246080"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.9.1/suve-cli_1.9.1_linux_amd64.tar.gz"
      sha256 "3d96c0fa2318ad5bb8cd44e3573a19d859f7583efd1bc9cbdea9ba8857980d5a"
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
