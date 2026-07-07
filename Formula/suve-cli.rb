class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.3.1"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.3.1/suve_1.3.1_darwin_arm64.tar.gz"
      sha256 "10917010036f2c0a7cb475754ff95a98b5310528cd412e001b102030a122d8ac"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.3.1/suve_1.3.1_darwin_amd64.tar.gz"
      sha256 "2df0f10e47ec845d9a857c55b21cf9e6b974cb78c1232222c9681c12f9977670"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.3.1/suve-cli_1.3.1_linux_arm64.tar.gz"
      sha256 "0441de0891aef8c0093f4bde280e0ada0de42ab49edf544595c2508cb7321898"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.3.1/suve-cli_1.3.1_linux_amd64.tar.gz"
      sha256 "91084b766b6cc8bac6abbe76fa7982d82476036f9ce81d76aa2301842f80b89e"
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
