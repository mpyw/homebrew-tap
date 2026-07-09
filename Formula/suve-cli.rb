class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "1.5.2"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.5.2/suve_1.5.2_darwin_arm64.tar.gz"
      sha256 "e6eb90d94d9e67dd2d0fc927f0fd8fb7d435840b60d248eb3b02379d09ac9cfb"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.5.2/suve_1.5.2_darwin_amd64.tar.gz"
      sha256 "a43d4cb5af4fc80f4e520886c289d777ccb0bd9001a0ecbfe25f00168ab83630"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v1.5.2/suve-cli_1.5.2_linux_arm64.tar.gz"
      sha256 "567937ceba5251eef8500a8f8ec5bf4ad186d2ed669d8063e67f2cd273c0fbef"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v1.5.2/suve-cli_1.5.2_linux_amd64.tar.gz"
      sha256 "eb5a4e14bae07a636ad424c994400c38f9380457ca35f6bdfc916af60c74c83c"
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
