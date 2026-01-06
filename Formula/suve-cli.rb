class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "0.6.4"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.6.4/suve_0.6.4_darwin_arm64.tar.gz"
      sha256 "480e904a1f33fcfe18172384d1413334610a3825c050928d42d1c18fec00bbe5"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.6.4/suve_0.6.4_darwin_amd64.tar.gz"
      sha256 "45db002acff5bcbe6090473232fadca8ca17eb4930cb8d9b4d13431562b224f7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.6.4/suve-cli_0.6.4_linux_arm64.tar.gz"
      sha256 "3c473bfd88c6907a7286331f5f4a1cf287fd3af0ed2380f73657713ef344b722"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.6.4/suve-cli_0.6.4_linux_amd64.tar.gz"
      sha256 "17c51e142d7a863c74a8ade8f4505155158944c220c27f53ca43292396365eec"
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
