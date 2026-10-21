class SqlHttpProxy < Formula
  desc "YAML configuration-based HTTP to SQL proxy server"
  homepage "https://github.com/mpyw/sql-http-proxy"
  license "MIT"
  version "0.1.5"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/sql-http-proxy/releases/download/v0.1.5/sql-http-proxy_0.1.5_darwin_arm64.tar.gz"
      sha256 "4348d36b50dfd39cd2438e8ba323afed22b283c25079d0dee17abede9db3cfa6"
    end
    on_intel do
      url "https://github.com/mpyw/sql-http-proxy/releases/download/v0.1.5/sql-http-proxy_0.1.5_darwin_amd64.tar.gz"
      sha256 "cb516c25a6a777a06ff7a939ed87cb195c4735e00f14ccf2d7e5449df99fddc0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/sql-http-proxy/releases/download/v0.1.5/sql-http-proxy_0.1.5_linux_arm64.tar.gz"
      sha256 "58bce363d2176d0ababda4ffc07976a0888458a03a52798127c35db52d8dcc59"
    end
    on_intel do
      url "https://github.com/mpyw/sql-http-proxy/releases/download/v0.1.5/sql-http-proxy_0.1.5_linux_amd64.tar.gz"
      sha256 "8ea66b627bf37df5bf5bf7559b462f897078cd0f23243a587069775085bd6242"
    end
  end

  def install
    bin.install "sql-http-proxy"
  end

  test do
    system bin/"sql-http-proxy", "--version"
  end
end
