class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.8.4"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.8.4/suve_1.8.4_darwin_arm64.tar.gz"
      sha256 "124fff0ed0b300bbe2560b7e202a7c8af68b4e098796516e6402f6038e37a596"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.8.4/suve_1.8.4_darwin_amd64.tar.gz"
      sha256 "0c949f9cf76f1d5b95350e54f495f0ea8c258e1b13d11c8c85c353904e3c5755"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.8.4/suve-cli_1.8.4_linux_arm64.tar.gz"
      sha256 "04eb5010a74d267e00cd5a4d84884174e069897773392109877ff5e417856202"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.8.4/suve-cli_1.8.4_linux_amd64.tar.gz"
      sha256 "101631353a0f5c63ef7ea3260bdb6b142c33d6338ca84109f2bb124fb57ca6e6"
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
