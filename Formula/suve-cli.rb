class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.10.0"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.10.0/suve_1.10.0_darwin_arm64.tar.gz"
      sha256 "746bf82476995a608d718bc227179711380b9dd0a26b148c27770c1c96c09e5d"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.10.0/suve_1.10.0_darwin_amd64.tar.gz"
      sha256 "de3079c3e795fda352499586190439aaef9eda5f3156ff197d188ca5a4fd3513"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.10.0/suve-cli_1.10.0_linux_arm64.tar.gz"
      sha256 "6b1284cfba729538bb6164ccb020b5f82c9d63ccf3a9289b2bc3723f37e18357"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.10.0/suve-cli_1.10.0_linux_amd64.tar.gz"
      sha256 "c31d1621c423f2151f3728c7c5c99fe80031e5bbb93fd45fc48f6b0c91229cbe"
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
