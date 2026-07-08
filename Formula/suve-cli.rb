class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.4.4"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.4.4/suve_1.4.4_darwin_arm64.tar.gz"
      sha256 "88defbe4d4c9afc33f4049b164c19f13ce11e18a389919b656303835a80d05de"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.4.4/suve_1.4.4_darwin_amd64.tar.gz"
      sha256 "8a7481733b3f73d737d774481e8209ca55486362a51df564db5996bc82e53d4c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.4.4/suve-cli_1.4.4_linux_arm64.tar.gz"
      sha256 "0155aefe113e7d4284314bd535f84d3e14cd74e737c0f696ae7ecb99b8f8a4ea"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.4.4/suve-cli_1.4.4_linux_amd64.tar.gz"
      sha256 "855e20c12727c4a8993f05dff50bb072cb879776b31f21caf9bada9107a8b443"
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
