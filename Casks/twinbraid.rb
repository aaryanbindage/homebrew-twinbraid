cask "twinbraid" do
  arch arm: "arm64", intel: "x64"

  version "0.2.3"
  sha256 arm:   "e20a56838eab307be638fd2db0a6f81708941d76a13372d998f7b15d038bd415",
         intel: "4e8ea37ec3a6a6800122fb5d7abd2ec42650726298ff4437a453c47ebe2bb61f"

  url "https://github.com/aaryanbindage/twinbraid/releases/download/v#{version}/Twinbraid-#{version}-mac-#{arch}.dmg"
  name "Twinbraid"
  desc "Run two coding agents (Claude Code, Codex, local models) together on one project"
  homepage "https://github.com/aaryanbindage/twinbraid"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Twinbraid.app"

  zap trash: "~/.twinbraid"

  caveats <<~EOS
    Twinbraid is not signed or notarized yet. If macOS blocks the first launch,
    right-click the app and choose Open, or run:
      xattr -dr com.apple.quarantine /Applications/Twinbraid.app
  EOS
end
