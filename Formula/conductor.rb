class Conductor < Formula
  desc "Run the Conductor CLI and daemon with bundled Node.js runtime"
  homepage "https://conductor-ai.top/"
  version "0.2.42"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lovemoon-ai/conductor/releases/download/v#{version}/conductor-v#{version}-darwin-arm64.tar.gz"
      sha256 "6f70f40c6cba9f0ea53125d22c60a3487f34d7b659b501ed71bd42bd4b7e6978"
    else
      url "https://github.com/lovemoon-ai/conductor/releases/download/v#{version}/conductor-v#{version}-darwin-x64.tar.gz"
      sha256 "5d15f629ebcf0a1cfb3535b1b5f76c56c98db477649d23c6644dcb8a03545bd1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lovemoon-ai/conductor/releases/download/v#{version}/conductor-v#{version}-linux-arm64.tar.gz"
      sha256 "0d20958e2ea0fd3b382335e7d2ffdb5f32e4b1bb3c75704d9bb73a51a720bfe2"
    else
      url "https://github.com/lovemoon-ai/conductor/releases/download/v#{version}/conductor-v#{version}-linux-x64.tar.gz"
      sha256 "f8f06803bdfdce7cb5bdc75984384300d894532c39e0ced4fae52fe5cae10b5e"
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
