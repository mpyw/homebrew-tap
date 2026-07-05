class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "0.8.0"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.8.0/suve_0.8.0_darwin_arm64.tar.gz"
      sha256 "62c1b5414c79982407c0084502a6d661ba20aece6c6590ca8afffbad4af4ef03"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.8.0/suve_0.8.0_darwin_amd64.tar.gz"
      sha256 "eb222df4ecaf25ebccc4703855843249fb1b15674682fbe4082fe89c3165f1f8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.8.0/suve-cli_0.8.0_linux_arm64.tar.gz"
      sha256 "d68bd6c7b84b1c744433289cc7a36819f8bd2d1bd62d5d2a0e76183a5693ba83"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.8.0/suve-cli_0.8.0_linux_amd64.tar.gz"
      sha256 "ad63c2e6dc1605724c6d2164dd2d2cd6ed9cd4694fa2c27825a17434705afdaa"
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
