class Suve < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "0.5.2"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.5.2/suve_0.5.2_darwin_arm64.tar.gz"
      sha256 "1220ef16b20926eb67a99eff571faa59b5a61bb34b0f98aa05095a1698bb2c91"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.5.2/suve_0.5.2_darwin_amd64.tar.gz"
      sha256 "5c3ce9cb90d739d786c94b9b0021ca4075a7e8c603b684d14c23a635c40d0482"
    end
  end

  def install
    bin.install "suve"
  end

  test do
    system bin/"suve", "--version"
  end
end
