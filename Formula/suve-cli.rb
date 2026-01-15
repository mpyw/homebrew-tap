class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "0.7.4"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.7.4/suve_0.7.4_darwin_arm64.tar.gz"
      sha256 "45b5de52dc90c86ce3cbc6b6caf8835f0d27bd12de4a113755b443132b08f037"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.7.4/suve_0.7.4_darwin_amd64.tar.gz"
      sha256 "2fe3ed544af1e081eee4df817005750ca5632ef98f9f51a5d6ee88e9191f6563"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.7.4/suve-cli_0.7.4_linux_arm64.tar.gz"
      sha256 "38b79a0918424b530b719a93524b29bb40c1eb3ba75e59e8d40238ba4e74ec9c"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.7.4/suve-cli_0.7.4_linux_amd64.tar.gz"
      sha256 "834c3abe8912b2d545cc4a60ff1e8f7939f5498da5db410680bab3f698a9ddb5"
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
