class Conductor < Formula
  desc "Run the Conductor CLI and daemon with bundled Node.js runtime"
  homepage "https://conductor.conductor-ai.top/"
  version "0.11.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lovemoon-ai/conductor/releases/download/v#{version}/conductor-v#{version}-darwin-arm64.tar.gz"
      sha256 "200a12300bc4aba0b81da6d98c292b8bd96efd35c0eb491455efc2fc39c42c14"
    else
      url "https://github.com/lovemoon-ai/conductor/releases/download/v#{version}/conductor-v#{version}-darwin-x64.tar.gz"
      sha256 "04463d148e829c74dec8046c74ea6c2facd6254cf92385bd3db9fe4a5a133c19"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lovemoon-ai/conductor/releases/download/v#{version}/conductor-v#{version}-linux-arm64.tar.gz"
      sha256 "620ebf122ad928cd274b7504a32dc715b8f782c68e5177afa705a9230926bd0c"
    else
      url "https://github.com/lovemoon-ai/conductor/releases/download/v#{version}/conductor-v#{version}-linux-x64.tar.gz"
      sha256 "0e58abb7c62479b5bbcb593a25091efa65c87406b3fdae133f88f71c9ee4f8c9"
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
