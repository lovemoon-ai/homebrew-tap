class Conductor < Formula
  desc "Run the Conductor CLI and daemon with bundled Node.js runtime"
  homepage "https://conductor.conductor-ai.top/"
  version "0.13.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lovemoon-ai/conductor/releases/download/v#{version}/conductor-v#{version}-darwin-arm64.tar.gz"
      sha256 "43374a6d682f55952a9c2e0532a85b83993ebf1afa29cb76cc02c2f29ffcd809"
    else
      url "https://github.com/lovemoon-ai/conductor/releases/download/v#{version}/conductor-v#{version}-darwin-x64.tar.gz"
      sha256 "067a16db121f1bc72ca9111c961eaa33fc2dd7d165e95731b214592a24c58ca2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lovemoon-ai/conductor/releases/download/v#{version}/conductor-v#{version}-linux-arm64.tar.gz"
      sha256 "8aa3f9d1d7a144170a2068c70d3d8f564f520f9954157276fee49f3754845ae3"
    else
      url "https://github.com/lovemoon-ai/conductor/releases/download/v#{version}/conductor-v#{version}-linux-x64.tar.gz"
      sha256 "e222a06afa19f9f85f1232993f26fee3f868e44b144c6ae863b44a4b7a62ff77"
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
