class Workspace < Formula
  desc "Declarative native iTerm2 workspaces"
  homepage "https://github.com/Coconut924/workspace"
  version "0.2.0"

  depends_on :macos

  on_arm do
    url "https://github.com/Coconut924/workspace/releases/download/v0.2.0/workspace-0.2.0-macos-arm64.tar.gz"
    sha256 "1ecc1ba52bed74af04383a476e13393016556d56d5f80c73716ba4d843ce0673"
  end

  on_intel do
    url "https://github.com/Coconut924/workspace/releases/download/v0.2.0/workspace-0.2.0-macos-x86_64.tar.gz"
    sha256 "03fe9cd45531e71b2b360fab782bc122749502fff3e50ea1ed82bf999088f13d"
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
