class Suve < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "0.5.4"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.5.4/suve_0.5.4_darwin_arm64.tar.gz"
      sha256 "4df250f479cf003fbb53c8711bcd8a5cb11c18a191f20396b39dd44173db5dbb"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.5.4/suve_0.5.4_darwin_amd64.tar.gz"
      sha256 "1f58080674b42a45cc5f94cd57d0c4e89de2c483d90a8b4270e7e53fd8f2f1ea"
    end
  end

  def install
    bin.install "suve"
  end

  test do
    system bin/"suve", "--version"
  end
end
