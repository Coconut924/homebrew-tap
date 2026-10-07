class Workspace < Formula
  desc "Declarative native iTerm2 workspaces"
  homepage "https://github.com/Coconut924/workspace"
  version "0.1.0"

  depends_on :macos

  on_arm do
    url "https://github.com/Coconut924/workspace/releases/download/v0.1.0/workspace-0.1.0-macos-arm64.tar.gz"
    sha256 "3f78ed9305dbe4ba1972453f00e6215e22e3b078e998d81deb65a91731c6ac66"
  end

  on_intel do
    url "https://github.com/Coconut924/workspace/releases/download/v0.1.0/workspace-0.1.0-macos-x86_64.tar.gz"
    sha256 "4920cdd9ab62d0d2d2f4636e091639359ad46033edc431b2d9baf892e832081f"
  end

  def install
    bin.install "workspace"
    pkgshare.install "examples"
  end

  def caveats
    <<~EOS
      Requires iTerm2 with Settings > General > Magic > Enable Python API enabled.
      Approve the workspace connection prompt on first launch.
      Examples: #{pkgshare}/examples
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/workspace --version").strip
    system "#{bin}/workspace", "init"
    system "#{bin}/workspace", "validate"
  end
end
