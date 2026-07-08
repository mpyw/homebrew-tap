class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.4.5"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.4.5/suve_1.4.5_darwin_arm64.tar.gz"
      sha256 "a899e5dc0fcbef118315ba1beacf9d2dd6807a5b6c32ba26aec95bf9eba1caa8"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.4.5/suve_1.4.5_darwin_amd64.tar.gz"
      sha256 "29ab3d796294ef9c5484f04674e8019fde6c24507872469f292a1f24fb5a0282"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.4.5/suve-cli_1.4.5_linux_arm64.tar.gz"
      sha256 "668266a861279ec735f3ff4e685fec407196c1ec6470de6542804d6b26936103"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.4.5/suve-cli_1.4.5_linux_amd64.tar.gz"
      sha256 "67ff9f48c1a5debb39d0b57b55b2cae9a553958af163982c5e2d0389d6fec73c"
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
