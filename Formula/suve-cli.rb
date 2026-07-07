class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.2.0"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.2.0/suve_1.2.0_darwin_arm64.tar.gz"
      sha256 "6d5b2f68328e0fb2651d487bef819080408241296d0cb3461bf84cc89cfa257a"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.2.0/suve_1.2.0_darwin_amd64.tar.gz"
      sha256 "a7a14a7721d5e8fccf727d5f995819eac5d7471a153541d925e29b2547a57c92"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.2.0/suve-cli_1.2.0_linux_arm64.tar.gz"
      sha256 "f91bb63009ba44de6edd6e3b12468b556051d95ace20cbe7ddb101d8ec1ec06c"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.2.0/suve-cli_1.2.0_linux_amd64.tar.gz"
      sha256 "ece711c54dafa727f522c130dc96154d5b7fb1afa663fe31c2e5035e3e4b9a7d"
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
