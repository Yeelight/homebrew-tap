class YeelightHome < Formula
  desc "Yeelight Home local Runtime CLI"
  homepage "https://github.com/Yeelight/yeelight-home"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Yeelight/yeelight-home/releases/download/yeelight-home-v0.1.0/yeelight-home-darwin-arm64.tar.gz"
      sha256 "d9096d6e8ca9cb205fe55d2620a549b80657d7365f266a767b80fa14ac4c6a1e"
    else
      url "https://github.com/Yeelight/yeelight-home/releases/download/yeelight-home-v0.1.0/yeelight-home-darwin-amd64.tar.gz"
      sha256 "614ce3071c39bf67fbcb1ab5c30915770d011726da83d14d4a093bc648282a7c"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Yeelight/yeelight-home/releases/download/yeelight-home-v0.1.0/yeelight-home-linux-arm64.tar.gz"
      sha256 "d215062c1b5609ed98330d1ecbdd0fe5bf426edd59c287a8b75fc18aa39eab88"
    else
      url "https://github.com/Yeelight/yeelight-home/releases/download/yeelight-home-v0.1.0/yeelight-home-linux-amd64.tar.gz"
      sha256 "2be6957f32e1d35bdd77815863a8df9368ddaa147039f7470594ec953a3ccded"
    end
  end

  def install
    bin.install "yeelight-home"
  end

  test do
    assert_match "yeelight-home contract 1.0", shell_output("#{bin}/yeelight-home version")
  end
end
