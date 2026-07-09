class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.6.1"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.6.1/suve_1.6.1_darwin_arm64.tar.gz"
      sha256 "4dc415b9e89fe0e5a2c008a35b1d346eac402cf6781b9f918aa3ede768a13afc"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.6.1/suve_1.6.1_darwin_amd64.tar.gz"
      sha256 "1812938256aa7286244de87a72111d6bb99c9e0cd31015e4489c589e715372df"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.6.1/suve-cli_1.6.1_linux_arm64.tar.gz"
      sha256 "6992eebec73bcd6aa993eb8191cab5da9c9f39c2cffe239d56fbc4cc1509ddd8"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.6.1/suve-cli_1.6.1_linux_amd64.tar.gz"
      sha256 "9501fbf2a4353306596cd22fcd171f339589e38f48ca4e8652b8cd727c81a58b"
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
