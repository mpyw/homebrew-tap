class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.8.2"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.8.2/suve_1.8.2_darwin_arm64.tar.gz"
      sha256 "27d419c2d0a79d21a8205887db35ede75b36a556ba8ca32de3ef97432bc3cb37"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.8.2/suve_1.8.2_darwin_amd64.tar.gz"
      sha256 "f7352f57ed9a382073b9cace4333f303a4ff8dbe92fc05af087e7733314f6088"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.8.2/suve-cli_1.8.2_linux_arm64.tar.gz"
      sha256 "b68509b20b3889a6050c1aa1450ee74a8b1cb7a296626db1bb78ee50f63728cb"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.8.2/suve-cli_1.8.2_linux_amd64.tar.gz"
      sha256 "f1119a835c57856b88d765026564b94bdd46602c19f5709e7f47dac55d38376e"
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
