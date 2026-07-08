class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.4.6"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.4.6/suve_1.4.6_darwin_arm64.tar.gz"
      sha256 "0bdbf2d22dc524766e81c79d9679b1bdfa4d489d444de84b546a342cb6209c39"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.4.6/suve_1.4.6_darwin_amd64.tar.gz"
      sha256 "65beb25c1f08946549c8530b04552459784c94fd9b2b8cdd712548637d4ec56a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.4.6/suve-cli_1.4.6_linux_arm64.tar.gz"
      sha256 "9a70343a85517b8d91c57e72d4cec1563a7056a524b819021160153ed851dd32"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.4.6/suve-cli_1.4.6_linux_amd64.tar.gz"
      sha256 "ad2ea4ca54146bb2963765482b7b3b7d073fce7179d2331bed76975716d3fe70"
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
