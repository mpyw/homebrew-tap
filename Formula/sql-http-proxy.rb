class SqlHttpProxy < Formula
  desc "YAML configuration-based HTTP to SQL proxy server"
  homepage "https://github.com/mpyw/sql-http-proxy"
  license "MIT"
  version "0.0.2"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/sql-http-proxy/releases/download/v0.0.2/sql-http-proxy_0.0.2_darwin_arm64.tar.gz"
      sha256 "e747ff35c130c17b45bd29616040a6db63c6cae7dbf7df0c0502794fa75bb11b"
    end
    on_intel do
      url "https://github.com/mpyw/sql-http-proxy/releases/download/v0.0.2/sql-http-proxy_0.0.2_darwin_amd64.tar.gz"
      sha256 "12b03f88f421daf7a1525cc2ae83a6064151018d1fe305780ec78b75d9eb6fd8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/sql-http-proxy/releases/download/v0.0.2/sql-http-proxy_0.0.2_linux_arm64.tar.gz"
      sha256 "d1609eb7dfaeff9e21ed393cb7dfe64580fa2031ca0a5cc1ca679da95b9c4734"
    end
    on_intel do
      url "https://github.com/mpyw/sql-http-proxy/releases/download/v0.0.2/sql-http-proxy_0.0.2_linux_amd64.tar.gz"
      sha256 "d6d21a7ed8781069a781b0b6395e881acf95cb36b7a008aeb0014a13d0cb3dc8"
    end
  end

  def install
    bin.install "sql-http-proxy"
  end

  test do
    system bin/"sql-http-proxy", "--version"
  end
end
