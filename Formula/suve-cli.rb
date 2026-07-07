class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.4.0"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.4.0/suve_1.4.0_darwin_arm64.tar.gz"
      sha256 "07dd6e1321c340efc4fc5438ff7cea3dedeee00f2b0db256fa32075068d9973f"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.4.0/suve_1.4.0_darwin_amd64.tar.gz"
      sha256 "264e9f1e9d54f1f3f5c5cea705e3b7816485d14c249f69351c09871806840e6e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.4.0/suve-cli_1.4.0_linux_arm64.tar.gz"
      sha256 "2ad67e52c6d1113bbe812b78b5cab409b11ffb537ce9532d8d1ba2e8b3b35dbb"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.4.0/suve-cli_1.4.0_linux_amd64.tar.gz"
      sha256 "204438a81d32edf43899ad6e05eaed4e1cbfc5abb1b5fc3d51d3abca50f9b726"
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
