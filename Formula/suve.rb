class Suve < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "0.4.7"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.4.7/suve_0.4.7_darwin_arm64.tar.gz"
      sha256 "204e7f2bbe9ce312dbf99a5c56c99e07030b630627be003687d2766d1d72a866"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.4.7/suve_0.4.7_darwin_amd64.tar.gz"
      sha256 "fb988923052db8f0e5840bccbe503befbe7941d4b42700952c787984a9b2fe91"
    end
  end

  def install
    bin.install "suve"
  end

  test do
    system bin/"suve", "--version"
  end
end
