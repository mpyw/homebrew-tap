class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.3.2"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.3.2/suve_1.3.2_darwin_arm64.tar.gz"
      sha256 "4307138572bbb1ca10f745e1cdb4fc16a6f2f14730f6afad9fca6195d2f36e32"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.3.2/suve_1.3.2_darwin_amd64.tar.gz"
      sha256 "d105b3105ae7eea95c19df12d312e8f8f22cc319e7e9a812d96df61ef054d524"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.3.2/suve-cli_1.3.2_linux_arm64.tar.gz"
      sha256 "136b1dde5149e4cc29d0760b8d41d56a85db1ce030a8214074697034c245b202"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.3.2/suve-cli_1.3.2_linux_amd64.tar.gz"
      sha256 "fc9135bd33acff4cbb5b37db12c4b55c7590cd6d34c813e204e08882232bdf98"
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
