class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.1.0"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.1.0/suve_1.1.0_darwin_arm64.tar.gz"
      sha256 "728d1c0490099ddbf64c21578af8a116e60c176aa2bb6ccd8eaa39ac3d725414"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.1.0/suve_1.1.0_darwin_amd64.tar.gz"
      sha256 "ff9bd80aad4c08bc491a673a0f7dd812d53c01f190c340a29257afcdc55b50d5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.1.0/suve-cli_1.1.0_linux_arm64.tar.gz"
      sha256 "b1193fb52e1c1b1bc568630a8631ab26360ff1070421410e2703a7821527199f"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.1.0/suve-cli_1.1.0_linux_amd64.tar.gz"
      sha256 "3dd76689059bebe1a3eb165da58e0f00573096debc10e84ecc01a8649ab4f1c1"
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
