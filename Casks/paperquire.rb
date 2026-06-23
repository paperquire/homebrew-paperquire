# Homebrew Cask for PaperQuire
# Repo: github.com/paperquire/homebrew-paperquire
#
# Users install via:
#   brew tap paperquire/paperquire
#   brew install --cask paperquire
#
# To update: bump `version`, update `sha256`, push to the tap repo.
# The CI publish script (homebrew/update-cask.sh) automates this on release.

cask "paperquire" do
  version "0.1.0"
  sha256 :no_check # Replace with actual SHA after first release

  on_arm do
    url "https://github.com/paperquire/releases/releases/download/v#{version}/PaperQuire-#{version}-arm64.dmg",
        verified: "github.com/paperquire/releases/"
  end
  on_intel do
    url "https://github.com/paperquire/releases/releases/download/v#{version}/PaperQuire-#{version}-x64.dmg",
        verified: "github.com/paperquire/releases/"
  end

  name "PaperQuire"
  desc "Markdown to branded PDF — desktop app with CLI"
  homepage "https://paperquire.com/"

  app "PaperQuire.app"
  binary "#{appdir}/PaperQuire.app/Contents/Resources/bin/paperquire", target: "paperquire"

  zap trash: [
    "~/.paperquire",
    "~/Library/Application Support/PaperQuire",
    "~/Library/Caches/com.paperquire.app",
    "~/Library/Preferences/com.paperquire.app.plist",
  ]
end
