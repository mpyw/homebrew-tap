class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.0.0/suve_1.0.0_darwin_arm64.tar.gz"
      sha256 "f4d44ff11cbad77622d62095c430bdb331d25d6cfdf9de0689a0d83fdd4524b3"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.0.0/suve_1.0.0_darwin_amd64.tar.gz"
      sha256 "2b439a2476e4a444b2b8d83943f6250075c002ef85c79500d2f19562542e77c9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.0.0/suve-cli_1.0.0_linux_arm64.tar.gz"
      sha256 "a88ee41c5c1b9207ffb4aeb43b731c9abd75b5bd28ecfc2fb46af99f2f801833"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.0.0/suve-cli_1.0.0_linux_amd64.tar.gz"
      sha256 "aa6879dc95c47fab116a34690f95581d01c227a961d0164658d4f6fa5df39746"
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
