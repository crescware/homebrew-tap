class Sbxm < Formula
  desc "CLI for managing Docker Sandboxes: per-project setup and daily operations"
  homepage "https://github.com/crescware/sbxm"
  url "https://github.com/crescware/sbxm/releases/download/v0.0.22/sbxm-aarch64-apple-darwin.tar.gz"
  sha256 "42e4a2a59e0fb64beef1706d51c747e92568ea350ce3aaaa7def384f15308a72"
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
