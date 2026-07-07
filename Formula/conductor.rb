class Conductor < Formula
  desc "Run the Conductor CLI and daemon with bundled Node.js runtime"
  homepage "https://conductor.conductor-ai.top/"
  version "0.7.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lovemoon-ai/conductor/releases/download/v#{version}/conductor-v#{version}-darwin-arm64.tar.gz"
      sha256 "31d89afc75a4c255247c08742fc214cd07ec0b729af67db6d3df708a8810ee20"
    else
      url "https://github.com/lovemoon-ai/conductor/releases/download/v#{version}/conductor-v#{version}-darwin-x64.tar.gz"
      sha256 "7848d619c66990598f4dbe900044c34b4c214bec04703fb63cdfacfcb7223f60"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lovemoon-ai/conductor/releases/download/v#{version}/conductor-v#{version}-linux-arm64.tar.gz"
      sha256 "0c995abae002f5c245ea95c0acf4c53945d9a6c8389e23d4c63084a4a251f035"
    else
      url "https://github.com/lovemoon-ai/conductor/releases/download/v#{version}/conductor-v#{version}-linux-x64.tar.gz"
      sha256 "79133dcfbb722ae58a31939a48ffe895959b71378d6fd33f6eeab7e14eaa4226"
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
