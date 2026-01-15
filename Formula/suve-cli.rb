class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "0.7.3"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.7.3/suve_0.7.3_darwin_arm64.tar.gz"
      sha256 "23b2207501e068e93a908b21377231580c28c4390ae1b154d0b998f8e5e9b7a9"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.7.3/suve_0.7.3_darwin_amd64.tar.gz"
      sha256 "9f41672e57bbc0c4eb93d39ec0177d9b17b10c90fdb5aa00f7f39b7c10342165"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.7.3/suve-cli_0.7.3_linux_arm64.tar.gz"
      sha256 "fff789525cf4ce2730afc2fdbd7eacc32f42d6f9d124152d2723e8a05b42fffd"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.7.3/suve-cli_0.7.3_linux_amd64.tar.gz"
      sha256 "e88f38ee1a95c186d628cb2e8d5d7ffd886aed4fa0987c08a0792df8a4a6fe6b"
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
