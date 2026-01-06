class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "0.6.3"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.6.3/suve_0.6.3_darwin_arm64.tar.gz"
      sha256 "2f5ec36c0f2effe6a1fa0de3efd87c737ac69d43d139af32c39bf9e48922dbcd"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.6.3/suve_0.6.3_darwin_amd64.tar.gz"
      sha256 "2c302c0896690394b3855f67928bd01538dd21ff333decb198d7bd48eed5422c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.6.3/suve-cli_0.6.3_linux_arm64.tar.gz"
      sha256 "7cbeb2eed0b277301e1dc6e0f3d344b0d906a95e63ac7dea6b79fa6a38591fd0"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.6.3/suve-cli_0.6.3_linux_amd64.tar.gz"
      sha256 "431c7b4d461d667f38495ba149ac498c7ef56d77fb389737b822b32942ccc029"
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
