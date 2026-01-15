class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "0.7.6"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.7.6/suve_0.7.6_darwin_arm64.tar.gz"
      sha256 "a234c23a8167f1e295c9de846d605881ad9b9d70b1eaa2c0769f013fa9936a58"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.7.6/suve_0.7.6_darwin_amd64.tar.gz"
      sha256 "a377a75a444948beb5ec5cc4e78de4269abb10668715519ab7b450df636ef23b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.7.6/suve-cli_0.7.6_linux_arm64.tar.gz"
      sha256 "b3076b34e426c4f0774bca6847c4a10609b317914be5f24b731b6265d748aa07"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.7.6/suve-cli_0.7.6_linux_amd64.tar.gz"
      sha256 "816cf1674abc5fdee36eb954c61cc09db242188ce200bbc364a35366c36cac6b"
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
