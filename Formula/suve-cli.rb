class SuveCli < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager (CLI-only)"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "0.6.5"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.6.5/suve_0.6.5_darwin_arm64.tar.gz"
      sha256 "e8749d8de890830e14743cc237a9ccf99a612f7bd1b5e4246a6229258f1b560a"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.6.5/suve_0.6.5_darwin_amd64.tar.gz"
      sha256 "f4db3c4244df66f37788a8478bb27c3cdf0c8a1083b59e1d5fa01d0c44e0b0c2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.6.5/suve-cli_0.6.5_linux_arm64.tar.gz"
      sha256 "32dda5d1335edb80d49f9218b65e217c47192295ba106e3adb9d72719adb4e4a"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.6.5/suve-cli_0.6.5_linux_amd64.tar.gz"
      sha256 "50e37bf014332918ceaea381bc319088a6e73130c758c52bfa3f6bdacc6ba9fb"
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
