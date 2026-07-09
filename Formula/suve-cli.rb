class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.6.0"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.6.0/suve_1.6.0_darwin_arm64.tar.gz"
      sha256 "a2cd8ca5add72e9ce8726c20d13848b85383fcbf9570301ba2356b5d3306e0e2"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.6.0/suve_1.6.0_darwin_amd64.tar.gz"
      sha256 "541bf49d7d5e6276575fa72ae4744a00252fbc36713d3ef71961ae5908d8c7c7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.6.0/suve-cli_1.6.0_linux_arm64.tar.gz"
      sha256 "0bbedd443c83b2d2da19018e6e2e79f928873ee73794130b1b6a7f1a7bee2e8e"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.6.0/suve-cli_1.6.0_linux_amd64.tar.gz"
      sha256 "0786377769e8de09d78ad06a681b00ef5df64db3d9029ccee3d699e40181d49f"
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
