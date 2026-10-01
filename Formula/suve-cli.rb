class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.10.2"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.10.2/suve_1.10.2_darwin_arm64.tar.gz"
      sha256 "89049ebf9e4b39bf06cd12865ca156743aab477e5975f7aab655de34bd8256ae"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.10.2/suve_1.10.2_darwin_amd64.tar.gz"
      sha256 "d9a3750af8125be00378770bc43062bfce159a1a30977c3cb88a47a6e57fff98"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.10.2/suve-cli_1.10.2_linux_arm64.tar.gz"
      sha256 "fa7832eb03684fbfa61983c793ae7f606596f53dac19d053932f173950357435"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.10.2/suve-cli_1.10.2_linux_amd64.tar.gz"
      sha256 "5c273dc1080cdbf671545263a67a8cbee56d2d94e91173f9807c915d797e8515"
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
