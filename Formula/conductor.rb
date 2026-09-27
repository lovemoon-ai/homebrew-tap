class Conductor < Formula
  desc "Run the Conductor CLI and daemon with bundled Node.js runtime"
  homepage "https://conductor.conductor-ai.top/"
  version "0.15.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lovemoon-ai/conductor/releases/download/v#{version}/conductor-v#{version}-darwin-arm64.tar.gz"
      sha256 "130d90d65e4cc29179e4d8a2a4ea62eb7dc8d056f475c712b9398e9e1820de6b"
    else
      url "https://github.com/lovemoon-ai/conductor/releases/download/v#{version}/conductor-v#{version}-darwin-x64.tar.gz"
      sha256 "b469fdafc88049f868bf443fd9518feed75ddddb84a33b522ff0cb920979b7a0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lovemoon-ai/conductor/releases/download/v#{version}/conductor-v#{version}-linux-arm64.tar.gz"
      sha256 "386c00c2e26449f757c298637d6de2c1985ffd715a2bc6449b3a20f9c59a1e51"
    else
      url "https://github.com/lovemoon-ai/conductor/releases/download/v#{version}/conductor-v#{version}-linux-x64.tar.gz"
      sha256 "b4407bd67fbf79d9cde5d050fcdc901c40bf084849f5f36bba885b397d9b9aa0"
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
