class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.7.0"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.7.0/suve_1.7.0_darwin_arm64.tar.gz"
      sha256 "b70928456527d8fbd5cf130cb569df057a2f97cb89bd699fcf3140914d786cc0"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.7.0/suve_1.7.0_darwin_amd64.tar.gz"
      sha256 "d887b7a965403549a2267420fc163d35412cc734907872f59fb264adb2ba8ec2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.7.0/suve-cli_1.7.0_linux_arm64.tar.gz"
      sha256 "b6b44dfe5aab2cde7ac90833fb9f47f97824c1db538349e33f368a6d2dc376f6"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.7.0/suve-cli_1.7.0_linux_amd64.tar.gz"
      sha256 "65873257ceda84f72910092fd6e2c129ae326d42d6f83fffc615be9a1d1ecfcd"
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
