class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.8.3"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.8.3/suve_1.8.3_darwin_arm64.tar.gz"
      sha256 "0d8ca03791d7e4c1495dbd07430cd48a37180c9f1646be5ec5301d1cf30609d4"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.8.3/suve_1.8.3_darwin_amd64.tar.gz"
      sha256 "c79fa4c2a2e22b956ae55002fde8007e5d5fc65bcec433cb9b6062f73cba77d9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.8.3/suve-cli_1.8.3_linux_arm64.tar.gz"
      sha256 "c9a020f8903db6268038562a0edd6361eb72ca3620d346744779f32c73de3c88"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.8.3/suve-cli_1.8.3_linux_amd64.tar.gz"
      sha256 "0c5d00d593c482b7cbe1f7d170f90c0ea42776f289d4bab7f147ca34419ff08e"
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
