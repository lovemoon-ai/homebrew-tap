class Conductor < Formula
  desc "Run the Conductor CLI and daemon with bundled Node.js runtime"
  homepage "https://conductor.conductor-ai.top/"
  version "0.17.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lovemoon-ai/conductor/releases/download/v#{version}/conductor-v#{version}-darwin-arm64.tar.gz"
      sha256 "48f64d287f1e7a7a0284ffb96d0e39e9a3f1d8a10ae9683363310de81634fb1a"
    else
      url "https://github.com/lovemoon-ai/conductor/releases/download/v#{version}/conductor-v#{version}-darwin-x64.tar.gz"
      sha256 "186d6a0a2184dbb4498f5e943cccee8898ad2833e77fbe46fc15742cb412b155"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lovemoon-ai/conductor/releases/download/v#{version}/conductor-v#{version}-linux-arm64.tar.gz"
      sha256 "e7cf591a7aece0669aa708929b055bcef734f555faacd96f0537e0b3a14141d9"
    else
      url "https://github.com/lovemoon-ai/conductor/releases/download/v#{version}/conductor-v#{version}-linux-x64.tar.gz"
      sha256 "98dc2f1b23252c301b2595afa76e58067ef9d3db4faadf5b0f5d66c304654563"
    end
  end

  def install
    bin.install "bin/conductor"
    libexec.install Dir["libexec/*"]
  end

  test do
    assert_match "conductor version", shell_output("#{bin}/conductor --version")
  end
end
