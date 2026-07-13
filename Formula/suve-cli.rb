class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.9.0"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.9.0/suve_1.9.0_darwin_arm64.tar.gz"
      sha256 "50ff26530896d1a2d4fdeb512be66daef1e7074e8ea6fce230e3f95f9e9e987c"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.9.0/suve_1.9.0_darwin_amd64.tar.gz"
      sha256 "011e9a7b8ea93f61a52e62302e7d60e6933a8c8017936917f364991bdbbafcdd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.9.0/suve-cli_1.9.0_linux_arm64.tar.gz"
      sha256 "5ca64060e8d0976ec83b491667e251feab95062e5b0906312176916d81dfbc4c"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.9.0/suve-cli_1.9.0_linux_amd64.tar.gz"
      sha256 "39a9dde95f8f199edbdd5e6ec88a41c3dc54750edadac81ba55e80bdb118b8ba"
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
