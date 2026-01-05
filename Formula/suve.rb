class Suve < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "0.4.6"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.4.6/suve_0.4.6_darwin_arm64.tar.gz"
      sha256 "4a618bcf51e523eec1e91dc7e7a47f6a2610479e2f586ac3b860f4138ecee8c6"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.4.6/suve_0.4.6_darwin_amd64.tar.gz"
      sha256 "cf5022ef11a9f8c83b37462ec067723c9ccda6336912697e3ad51ee3eebf2c2e"
    end
  end

  def install
    bin.install "suve"
  end

  test do
    system bin/"suve", "--version"
  end
end
