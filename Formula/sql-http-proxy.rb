class SqlHttpProxy < Formula
  desc "YAML configuration-based HTTP to SQL proxy server"
  homepage "https://github.com/mpyw/sql-http-proxy"
  license "MIT"
  version "0.1.1"

  on_macos do
    on_arm do
      url "https://github.com/mpyw/sql-http-proxy/releases/download/v0.1.1/sql-http-proxy_0.1.1_darwin_arm64.tar.gz"
      sha256 "52a2c28ed26cf31a9d42811dd4ff217dbb42423efdcc946dc182bb5ca80e74a5"
    end
    on_intel do
      url "https://github.com/mpyw/sql-http-proxy/releases/download/v0.1.1/sql-http-proxy_0.1.1_darwin_amd64.tar.gz"
      sha256 "0b70c723ac2157c6d36a2ecc6b34219f7db4a277626a98bdb3aa7b3d37a6a25f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mpyw/sql-http-proxy/releases/download/v0.1.1/sql-http-proxy_0.1.1_linux_arm64.tar.gz"
      sha256 "50122ddba69fdf4b15db34b89e77b17ea48a0b64546a0af39786e611fc1062a4"
    end
    on_intel do
      url "https://github.com/mpyw/sql-http-proxy/releases/download/v0.1.1/sql-http-proxy_0.1.1_linux_amd64.tar.gz"
      sha256 "23dcffa52d677b23ac4e43ba3b5b5d9833dae03c836b6f53c7085b1bf8178877"
    end
  end

  def install
    bin.install "sql-http-proxy"
  end

  test do
    system bin/"sql-http-proxy", "--version"
  end
end
