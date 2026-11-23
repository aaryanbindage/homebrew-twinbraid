cask "twinbraid" do
  arch arm: "arm64", intel: "x64"

  version "0.2.2"
  sha256 arm:   "2c0dccfec4f24779b8e1390715f724f19e789bb466a4ed3963e78d37aa24730e",
         intel: "0127d641eade81edaf9ca98fec9b562f8aac73ffdd544a1ef75bf2ce0a035f3c"

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
