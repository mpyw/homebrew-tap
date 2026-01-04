class Suve < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "0.4.4"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.4.4/suve_0.4.4_darwin_arm64.tar.gz"
      sha256 "92d8ec625e594468bc3d7906928bc396e40bb9f7b35b00423213645436cb9b5f"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.4.4/suve_0.4.4_darwin_amd64.tar.gz"
      sha256 "a55202c3a29c726853844ab1bcd809a84a70c16ddc4974b80d7e93da7eb815ae"
    end
  end

  def install
    bin.install "suve"
  end

  test do
    system bin/"suve", "--version"
  end
end
