class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.10.1"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.10.1/suve_1.10.1_darwin_arm64.tar.gz"
      sha256 "61c39d9cd22860e4ac99c963c3e2d5aaebbc1ccc666932c2f2fc1cc2cdb3f745"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.10.1/suve_1.10.1_darwin_amd64.tar.gz"
      sha256 "aa85dffa7de9313c23a17d347e4eb822fa9f6ed3ce67363536efea699b2ba83d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.10.1/suve-cli_1.10.1_linux_arm64.tar.gz"
      sha256 "55528a67283d14b06bc7548c5f72ea762eac3b6a2bab43828d544f428ed87839"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.10.1/suve-cli_1.10.1_linux_amd64.tar.gz"
      sha256 "4000e161ed0e50aca0287386f5bcdfd6eec74c95109b0b5dc7b1e483c7ac221c"
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
