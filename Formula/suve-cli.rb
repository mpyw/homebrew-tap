class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "0.7.5"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.7.5/suve_0.7.5_darwin_arm64.tar.gz"
      sha256 "91f651ded6699fd997cc6552f93c3d500c007e5bca9e1cd9c20a0df63dc105e5"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.7.5/suve_0.7.5_darwin_amd64.tar.gz"
      sha256 "1745504eb5bf0d319b2a90b6f9522ca3dbcd7c30064a315f9621fb64d9ea3dcb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.7.5/suve-cli_0.7.5_linux_arm64.tar.gz"
      sha256 "4a89f7c77cca5dc78bc18d14f762ef9263a0dcfb08062542801e608ec53079ed"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.7.5/suve-cli_0.7.5_linux_amd64.tar.gz"
      sha256 "a2e20468d2dd2f8821203d56c2d3cbe07d36fe77bca7a0a97ac66d6da8a9b176"
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
