class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "0.8.1"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.8.1/suve_0.8.1_darwin_arm64.tar.gz"
      sha256 "f253d46d52bc06b6a67fba3ee6d23b6996ab9b372970a7d13bee1e026e9e2dfc"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.8.1/suve_0.8.1_darwin_amd64.tar.gz"
      sha256 "9a87b523d506c170921fb20f1b7a101f20c08afeb36a2d5ed714db773538c89e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.8.1/suve-cli_0.8.1_linux_arm64.tar.gz"
      sha256 "0c41d46d480cb4a47d2f2092b372487b6a94bcbac56b26c9b19e2e0445daebb8"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.8.1/suve-cli_0.8.1_linux_amd64.tar.gz"
      sha256 "cd0624d2a5c00957885afa30f7b6e2069377a21d5a5ffdfdcb37de50effb72ca"
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
