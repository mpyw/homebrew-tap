class Suve < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "0.5.0"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.5.0/suve_0.5.0_darwin_arm64.tar.gz"
      sha256 "3d60c47a91491b5f5458a3f7f22b5c5438de8030b1474c6bc7698bd39c83365e"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.5.0/suve_0.5.0_darwin_amd64.tar.gz"
      sha256 "ab1aadc3a8c6d1a084c6cd8dedd5369eaf7fad13f3383128f259d58573b13a42"
    end
  end

  def install
    bin.install "suve"
  end

  test do
    system bin/"suve", "--version"
  end
end
