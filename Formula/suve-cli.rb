class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.8.0"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.8.0/suve_1.8.0_darwin_arm64.tar.gz"
      sha256 "ee8c96dbd079e8bb0ab433b2240e6b5c124cee97179737c9c929fb88c6b9fb4b"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.8.0/suve_1.8.0_darwin_amd64.tar.gz"
      sha256 "070fcab81e1507dbce705376c829dab3fad2829f76ede26dc7adb3e861245b73"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.8.0/suve-cli_1.8.0_linux_arm64.tar.gz"
      sha256 "f979c4e0e7a540338093fbdf1374ec3fab6ea3d9cbc5c79dff476595a4706901"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.8.0/suve-cli_1.8.0_linux_amd64.tar.gz"
      sha256 "f0cf7789cd7c3368481e4001b2311f921e2b182f6d8e9d609b327633b2b7afc9"
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
