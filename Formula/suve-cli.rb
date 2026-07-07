class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.3.0"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.3.0/suve_1.3.0_darwin_arm64.tar.gz"
      sha256 "abc85b50eae57b2d57b5309dc1fc315d0256e373c761172442d1d64069899aa2"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.3.0/suve_1.3.0_darwin_amd64.tar.gz"
      sha256 "d97c8ff08ac005052dc2e9abba4a92cb1a15836ffa7f622d13ce5874d5da385f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.3.0/suve-cli_1.3.0_linux_arm64.tar.gz"
      sha256 "e2b051108db46ff31b4f75898787fa08000a8850f32aea6f5287b6127b8c7fbb"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.3.0/suve-cli_1.3.0_linux_amd64.tar.gz"
      sha256 "0f478c852b0e09e85000d447ff65c64eeb2631fdde79b932bad5912385c68f0e"
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
