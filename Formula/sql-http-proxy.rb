class SqlHttpProxy < Formula
  desc "YAML configuration-based HTTP to SQL proxy server"
  homepage "https://github.com/mpyw/sql-http-proxy"
  license "MIT"
  version "0.1.3"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/sql-http-proxy/releases/download/v0.1.3/sql-http-proxy_0.1.3_darwin_arm64.tar.gz"
      sha256 "63eddd041b8f91f7c189acafc4c1f2b59092eefe13e7e113cb802854f71514d7"
    end
    on_intel do
      url "https://github.com/mpyw/sql-http-proxy/releases/download/v0.1.3/sql-http-proxy_0.1.3_darwin_amd64.tar.gz"
      sha256 "3f13684fd6d9df17fc21c88fc96cc4e1b101f5bbc15ffb3cb842c04e26ccada2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/sql-http-proxy/releases/download/v0.1.3/sql-http-proxy_0.1.3_linux_arm64.tar.gz"
      sha256 "4c9a31432245ca27add876e10c0305acaa9c1ab6975a6dc867eab8d7306d8282"
    end
    on_intel do
      url "https://github.com/mpyw/sql-http-proxy/releases/download/v0.1.3/sql-http-proxy_0.1.3_linux_amd64.tar.gz"
      sha256 "3aa471a446289176f7f3d2cf1b3ece55995fb2c7e0ea8215c794d2b0ff0164cb"
    end
  end

  def install
    bin.install "sql-http-proxy"
  end

  test do
    system bin/"sql-http-proxy", "--version"
  end
end
