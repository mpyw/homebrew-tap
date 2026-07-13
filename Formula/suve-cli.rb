class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.8.5"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.8.5/suve_1.8.5_darwin_arm64.tar.gz"
      sha256 "5d43fb2ec05ffb993c3b5132d2dff9f69b2754097c577dd267e3938a039f4f93"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.8.5/suve_1.8.5_darwin_amd64.tar.gz"
      sha256 "f61c401f6be1baf87e6ed14c4e3f058431c114721db025902184f777e837426f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.8.5/suve-cli_1.8.5_linux_arm64.tar.gz"
      sha256 "96c01f11619c513a2275d953295e4f95a762ae4afaac3b825a64f8449656b5f2"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.8.5/suve-cli_1.8.5_linux_amd64.tar.gz"
      sha256 "7674c5602c4a017a2476b06812b1d6c60e1d6a317731ff60d354abb44d3fa248"
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
