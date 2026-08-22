class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.9.4"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.9.4/suve_1.9.4_darwin_arm64.tar.gz"
      sha256 "de9c61f4e489f7d82e87bd07a2bc36409ab34e60b7fb4cacb8cf318de18bcfe3"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.9.4/suve_1.9.4_darwin_amd64.tar.gz"
      sha256 "b3eaf5bcd2b49fc247c78b8dcd212c63616fcd869de23c176ebd47171497c2ee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.9.4/suve-cli_1.9.4_linux_arm64.tar.gz"
      sha256 "08e92ef7cc29410a54f0b1dbf1f280c0b01a7a5291f4415e4f0f775e13319be1"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.9.4/suve-cli_1.9.4_linux_amd64.tar.gz"
      sha256 "da5e6846818031b1806ba230319f318b4ef1f0de5bf92745bf054293994ebb81"
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
