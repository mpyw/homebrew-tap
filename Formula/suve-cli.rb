class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "0.6.1"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.6.1/suve_0.6.1_darwin_arm64.tar.gz"
      sha256 "a9a0916480a7608f54ddc1b88bed6f89108577336974eb30311befc128074581"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.6.1/suve_0.6.1_darwin_amd64.tar.gz"
      sha256 "7c05b2bce4e8ef2ebcd28316ba635c07383cea4fde723592e6fabf1be7742840"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.6.1/suve-cli_0.6.1_linux_arm64.tar.gz"
      sha256 "30bdfbf584c37155e37446562737abedfb620519565b5ac15be2d8bc39192385"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.6.1/suve-cli_0.6.1_linux_amd64.tar.gz"
      sha256 "26f238c52c6952be48578aff03a60e1ea4a97806224f8998d77bb0b2d2ea89d1"
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
