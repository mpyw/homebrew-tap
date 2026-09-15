class SqlHttpProxy < Formula
  desc "YAML configuration-based HTTP to SQL proxy server"
  homepage "https://github.com/mpyw/sql-http-proxy"
  license "MIT"
  version "0.1.4"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/sql-http-proxy/releases/download/v0.1.4/sql-http-proxy_0.1.4_darwin_arm64.tar.gz"
      sha256 "417378f068de3e027a3acb96291d609f01776b053e05bd0c97e1903a3241ed37"
    end
    on_intel do
      url "https://github.com/mpyw/sql-http-proxy/releases/download/v0.1.4/sql-http-proxy_0.1.4_darwin_amd64.tar.gz"
      sha256 "3738ed6657d719f4a4f74b9b9a8deaed6295b94df110743f565aecc16a55b215"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/sql-http-proxy/releases/download/v0.1.4/sql-http-proxy_0.1.4_linux_arm64.tar.gz"
      sha256 "56c4a8a254021527af027ea817221c9f52f1cc7758a1bb0a2d897f7940bf1b8b"
    end
    on_intel do
      url "https://github.com/mpyw/sql-http-proxy/releases/download/v0.1.4/sql-http-proxy_0.1.4_linux_amd64.tar.gz"
      sha256 "f229437562ce7db7ace03cce18ff7284f8f81efa89bc37ef8f9926f8be6072cc"
    end
  end

  def install
    bin.install "sql-http-proxy"
  end

  test do
    system bin/"sql-http-proxy", "--version"
  end
end
