class Suve < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "0.5.1"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.5.1/suve_0.5.1_darwin_arm64.tar.gz"
      sha256 "a24ee8f2879dfc4d4326871a1d9c2dd5013d3196954a6d104b76ee4b9af596ab"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.5.1/suve_0.5.1_darwin_amd64.tar.gz"
      sha256 "21e9481317a1d468c6fda8b9dbc5e777350cd7e19a7ed29b2badd1ab1203c22e"
    end
  end

  def install
    bin.install "suve"
  end

  test do
    system bin/"suve", "--version"
  end
end
