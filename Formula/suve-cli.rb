class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.5.1"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.5.1/suve_1.5.1_darwin_arm64.tar.gz"
      sha256 "a05262e1e6c4ff74aa4e705fd8d6acd796272c30090eacffb1348975dd8ab487"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.5.1/suve_1.5.1_darwin_amd64.tar.gz"
      sha256 "134784eab6b125da1ea240abaa33fd88ccbdcc9b190f4c84b9aee3749fae9bd6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.5.1/suve-cli_1.5.1_linux_arm64.tar.gz"
      sha256 "92e4b118a3238ebf97d34d2cd38e34ecc5143fe16e463db63b36cbe960118261"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.5.1/suve-cli_1.5.1_linux_amd64.tar.gz"
      sha256 "a55bb53a5f2b5c0b792fc150e041a024b36de7bb65960b8743fdd83a80c3ca3a"
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
