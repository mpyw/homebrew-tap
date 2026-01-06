class Suve < Formula
  desc "Git-like CLI for AWS Parameter Store and Secrets Manager"
  homepage "https://github.com/mpyw/suve"
  license "MIT"
  version "0.5.5"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.5.5/suve_0.5.5_darwin_arm64.tar.gz"
      sha256 "07a4bd14b9c6d3d7bbad0877190af57503836edd17523c8690cee53c435473db"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.5.5/suve_0.5.5_darwin_amd64.tar.gz"
      sha256 "9f58d00bcba2f7f12dcfd1490c12d844c45f6753d7f4cd096d5acc934f2e1f46"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/suve/releases/download/v0.5.5/suve_0.5.5_linux_arm64.tar.gz"
      sha256 "5e0935673f655091e61ecbfb8cd034ea0434416fd721e2eb77fe332c80852916"
    end
    on_intel do
      url "https://github.com/mpyw/suve/releases/download/v0.5.5/suve_0.5.5_linux_amd64.tar.gz"
      sha256 "86e1c15082551211dd2e94cdfd0af51d422257ad150a5311915a0e09219be48c"
    end
  end

  def install
    bin.install "suve"
  end

  test do
    system bin/"suve", "--version"
  end
end
