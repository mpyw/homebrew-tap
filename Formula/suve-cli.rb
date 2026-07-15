class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.9.2"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.9.2/suve_1.9.2_darwin_arm64.tar.gz"
      sha256 "936ccd2dc5d0b998b767fb061631b457ffe9187b6670d432f414178f949c258e"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.9.2/suve_1.9.2_darwin_amd64.tar.gz"
      sha256 "22b138033987cd6870f5a0f41eb026ee97781bcf54db078acb21974d106dc112"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.9.2/suve-cli_1.9.2_linux_arm64.tar.gz"
      sha256 "ec60c2f546d2e684b098bb5c1496606cc8671cde08d948e3b35530d3857dab74"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.9.2/suve-cli_1.9.2_linux_amd64.tar.gz"
      sha256 "c8f87170d0d2cda4d1a095ff61545f356ce41310cc35b3a53f25fc5cffb98293"
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
