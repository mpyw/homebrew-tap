class SqlHttpProxy < Formula
  desc "YAML configuration-based HTTP to SQL proxy server"
  homepage "https://github.com/mpyw/sql-http-proxy"
  license "MIT"
  version "0.1.2"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/sql-http-proxy/releases/download/v0.1.2/sql-http-proxy_0.1.2_darwin_arm64.tar.gz"
      sha256 "3c224d58cec074e4621b66fe7ee50a96a8135f3b36384748811a06304bb58d46"
    end
    on_intel do
      url "https://github.com/mpyw/sql-http-proxy/releases/download/v0.1.2/sql-http-proxy_0.1.2_darwin_amd64.tar.gz"
      sha256 "f8d49391ca798a6891818ab1bb64044286b16f233fb19d1b66e171201994450d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/sql-http-proxy/releases/download/v0.1.2/sql-http-proxy_0.1.2_linux_arm64.tar.gz"
      sha256 "0e65f8efaa475eda455ec96744ae47d95f7cf76ec7959d6bdd44ca0f2da2d409"
    end
    on_intel do
      url "https://github.com/mpyw/sql-http-proxy/releases/download/v0.1.2/sql-http-proxy_0.1.2_linux_amd64.tar.gz"
      sha256 "8939491df452e7d4205fb3c84afe4adb9e5fd3eae8a75f94d458a76687fafdfc"
    end
  end

  def install
    bin.install "sql-http-proxy"
  end

  test do
    system bin/"sql-http-proxy", "--version"
  end
end
