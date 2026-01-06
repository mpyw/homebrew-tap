class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "0.6.0"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.6.0/suve_0.6.0_darwin_arm64.tar.gz"
      sha256 "5d0895034c3bac5bae765b11a431bf7a59bf0a93ef5d62cd318e858e18980478"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.6.0/suve_0.6.0_darwin_amd64.tar.gz"
      sha256 "cf1b0224914801b6284a6498ab2c410d8e2f5a5968ef1ea626ccf4d1f310a9b4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.6.0/suve-cli_0.6.0_linux_arm64.tar.gz"
      sha256 "e261eb3259a9b5f0ea4b96a106bffcccc64920071d60053771d94f0f4e3c955d"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.6.0/suve-cli_0.6.0_linux_amd64.tar.gz"
      sha256 "65de4bf2747981af405b2140d4539a0dbc912c11eebac91cf59b583153d306c1"
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
