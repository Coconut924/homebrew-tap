class Workspace < Formula
  desc "Declarative native iTerm2 workspaces"
  homepage "https://github.com/Coconut924/workspace"
  version "0.3.0"

  depends_on :macos

  on_arm do
    url "https://github.com/Coconut924/workspace/releases/download/v0.3.0/workspace-0.3.0-macos-arm64.tar.gz"
    sha256 "a63e555344238d4c563d0076fb4001244f83719b70fad09b2354cb87eab0ab9d"
  end

  on_intel do
    url "https://github.com/Coconut924/workspace/releases/download/v0.3.0/workspace-0.3.0-macos-x86_64.tar.gz"
    sha256 "71bff28bb3de9119afc233d9d9fc6bbcfc4e5e1477430c96fbd7af8d23ca9792"
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
