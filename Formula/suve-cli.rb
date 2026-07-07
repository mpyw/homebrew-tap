class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.4.2"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.4.2/suve_1.4.2_darwin_arm64.tar.gz"
      sha256 "392916732ebfe0d51b2cb66d068ead5af4aa4f3beb26eb2687f2f891245ffe45"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.4.2/suve_1.4.2_darwin_amd64.tar.gz"
      sha256 "497b3d74d42333da9420131df7eed5f2904b730b8ad7a7f0ffb4e8234e8bd38f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.4.2/suve-cli_1.4.2_linux_arm64.tar.gz"
      sha256 "05d70c67f285ce1f1684abb1e2365b1ad7ee2f610a2423893b2df096123eb53c"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.4.2/suve-cli_1.4.2_linux_amd64.tar.gz"
      sha256 "01e1bc7955b507a2ae8f3102059b593a117fba55e2613404f7a624b489ecb306"
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
