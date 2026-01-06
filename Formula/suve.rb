class Suve < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "0.5.3"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.5.3/suve_0.5.3_darwin_arm64.tar.gz"
      sha256 "af8a5ace096e8d8d300ee9385360d9991ccd194408aae0a92a7fa7dff6855f8e"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.5.3/suve_0.5.3_darwin_amd64.tar.gz"
      sha256 "a67506eeb2340e82dfd5fdafa27db0cd6336a72ac30d76eae3b5253fe3851df7"
    end
  end

  def install
    bin.install "suve"
  end

  test do
    system bin/"suve", "--version"
  end
end
