class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.9.5"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.9.5/suve_1.9.5_darwin_arm64.tar.gz"
      sha256 "21e0a4c2af7d11e7e22f08eeb9c0e3b55b1819f9bc6ef01253d4dbc809493f8d"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.9.5/suve_1.9.5_darwin_amd64.tar.gz"
      sha256 "8aac16606549c11676f719838061468ce3826b062c51cb8af9452adef3da5f4a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.9.5/suve-cli_1.9.5_linux_arm64.tar.gz"
      sha256 "2cfbfbb3251bfd62e6651c1d2f7301f7ec646cc43c117905d37db73ecb88344d"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.9.5/suve-cli_1.9.5_linux_amd64.tar.gz"
      sha256 "844840f436f6dc6531cb2ea4eb1728bc0e869757c8200ff5fae3cf41f9312af3"
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
