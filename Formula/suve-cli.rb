class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "0.7.1"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.7.1/suve_0.7.1_darwin_arm64.tar.gz"
      sha256 "20d6cc2b6f5a8f3e281b7c6f372231366b5a43a7e62de721b4984835482d243e"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.7.1/suve_0.7.1_darwin_amd64.tar.gz"
      sha256 "21f9c2bc3c19d24a28cbc76f0985f7e1e48541945bc1ec52326bf4f8206a2814"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.7.1/suve-cli_0.7.1_linux_arm64.tar.gz"
      sha256 "2bee92434d3698aff9e4bfd78205b44193e99ba2013cda6d1d5c31e73a8bfd83"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.7.1/suve-cli_0.7.1_linux_amd64.tar.gz"
      sha256 "0c4733719b3bfdc1ec1c218573b25d5377aa3759048225186646c32dde4346c0"
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
