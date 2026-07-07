class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.1.1"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.1.1/suve_1.1.1_darwin_arm64.tar.gz"
      sha256 "b7c993bb2e07c131cd7d5b50219eb55e507482558dc88c360042a6ce6fb25513"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.1.1/suve_1.1.1_darwin_amd64.tar.gz"
      sha256 "195ddfc7280ea6b87c284854e7edc2904b90892c50de31f0dd96284f8f1739ec"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.1.1/suve-cli_1.1.1_linux_arm64.tar.gz"
      sha256 "50b7f9edf7498d611ba43bc10cfb88b9e346a0b5910df5c00e14ecf3a0c51a34"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.1.1/suve-cli_1.1.1_linux_amd64.tar.gz"
      sha256 "d26c3c0e408268109d197fafba42147effd134e666e2d1853ce520d43ecc5c43"
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
