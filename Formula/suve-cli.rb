class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.9.3"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.9.3/suve_1.9.3_darwin_arm64.tar.gz"
      sha256 "8c905a4d1b44c6124462146768f0f851a3624d7237e400291f26c5ab7c24bc60"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.9.3/suve_1.9.3_darwin_amd64.tar.gz"
      sha256 "63bf0c79334f29b3306e7f2c0fa9db8d287f7202259b0cd307bf94f03701f225"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.9.3/suve-cli_1.9.3_linux_arm64.tar.gz"
      sha256 "227a6febb4eaa3da77a127a1d12c4aef4ed807dc386d970b0f6950b0733b0dfc"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.9.3/suve-cli_1.9.3_linux_amd64.tar.gz"
      sha256 "c721d808ae26d6eb17ff9ed8c706a63794e974caf9060deff0c959336787f4cc"
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
