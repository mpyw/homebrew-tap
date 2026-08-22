class SqlHttpProxy < Formula
  desc "YAML configuration-based HTTP to SQL proxy server"
  homepage "https://github.com/mpyw/sql-http-proxy"
  license "MIT"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/sql-http-proxy/releases/download/v0.1.0/sql-http-proxy_0.1.0_darwin_arm64.tar.gz"
      sha256 "a386e2ec75f1a6ef2acf05146e0df900d5c941955c54d686572f0f67cf1cbd80"
    end
    on_intel do
      url "https://github.com/mpyw/sql-http-proxy/releases/download/v0.1.0/sql-http-proxy_0.1.0_darwin_amd64.tar.gz"
      sha256 "eaa414d6ab0928c38ccb122a65c334235cbd7e2e207d8cc00a9e3f990e4ae005"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/sql-http-proxy/releases/download/v0.1.0/sql-http-proxy_0.1.0_linux_arm64.tar.gz"
      sha256 "7a5f764eda8a71f966d7b13bf64eefdc2d5d8faa06f1d8bfa135ee20f09b2584"
    end
    on_intel do
      url "https://github.com/mpyw/sql-http-proxy/releases/download/v0.1.0/sql-http-proxy_0.1.0_linux_amd64.tar.gz"
      sha256 "94a107b7943412dcc4067918d3500d3f9be7af75a97e667e82c426e9502ee5cc"
    end
  end

  def install
    bin.install "sql-http-proxy"
  end

  test do
    system bin/"sql-http-proxy", "--version"
  end
end
