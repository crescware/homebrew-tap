class Sbxm < Formula
  desc "CLI for managing Docker Sandboxes: per-project setup and daily operations"
  homepage "https://github.com/crescware/sbxm"
  url "https://github.com/crescware/sbxm/releases/download/v0.0.21/sbxm-aarch64-apple-darwin.tar.gz"
  sha256 "4d103c3186001cbf7ecd497abc9f707c88a7203543c96c66b6f6431b6af5c3dd"
  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  def install
    bin.install "sbxm"
  end

  def caveats
    <<~EOS
      sbxm drives Docker Sandboxes, which it does not install. It needs Docker
      Desktop with a running Docker Engine and the Docker Sandboxes CLI 0.37.0
      or later:
        https://docs.docker.com/ai/sandboxes/get-started/

      Check the host with:
        sbxm status --global
    EOS
  end

  test do
    assert_match "sbxm #{version}", shell_output("#{bin}/sbxm --version")
  end
end
