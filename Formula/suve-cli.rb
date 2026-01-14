class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "0.7.0"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.7.0/suve_0.7.0_darwin_arm64.tar.gz"
      sha256 "67f12dea1f770857cc3aea5540972972ddd4863296223de2032da6d9a2488c32"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.7.0/suve_0.7.0_darwin_amd64.tar.gz"
      sha256 "481dc6f56e2b66bc33238e95d9ce78fcd6811ca5d31e86a83c24cdb2e1a2c04e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.7.0/suve-cli_0.7.0_linux_arm64.tar.gz"
      sha256 "22a500b729cc968dff85d212a7071aa4ae18cf7a8dd4984f12550307d467efee"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.7.0/suve-cli_0.7.0_linux_amd64.tar.gz"
      sha256 "7790ab6d93d14c5c21493dc98fc6506282ca37ad4be77d06c430378ecda51229"
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
