class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.3.3"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.3.3/suve_1.3.3_darwin_arm64.tar.gz"
      sha256 "25ffa6685f053bdeff8fef4cfb2f644b178122620d4ba95eca52ed32ef43c3cf"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.3.3/suve_1.3.3_darwin_amd64.tar.gz"
      sha256 "fa35a17900332741055f7cfb9f7287961a15883636c0578c62e6c5ddedfd0495"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.3.3/suve-cli_1.3.3_linux_arm64.tar.gz"
      sha256 "b0040d685297ffed33ac8438b2a590ad00de64e036b8d8fa535aedeb9367b6ea"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.3.3/suve-cli_1.3.3_linux_amd64.tar.gz"
      sha256 "d217637bdb911d2ee8867abb4e79f8c59cdda1cbde16b777a7bb7842d5c072c8"
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
