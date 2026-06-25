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
  version "0.3.1"

  on_arm do
    url "https://github.com/paperquire/releases/releases/download/v#{version}/PaperQuire-#{version}-arm64.dmg",
        verified: "github.com/paperquire/releases/"
    sha256 "620171f49d9774b9d819501c59d6ed842fc157310c4fb896d2f796fba19bb248"
  end
  on_intel do
    url "https://github.com/paperquire/releases/releases/download/v#{version}/PaperQuire-#{version}-x64.dmg",
        verified: "github.com/paperquire/releases/"
    sha256 :no_check # Intel build not yet available
  end

  name "PaperQuire"
  desc "Markdown to branded PDF — desktop app with CLI"
  homepage "https://paperquire.com/"

  depends_on macos: :ventura

  app "PaperQuire.app"
  binary "#{appdir}/PaperQuire.app/Contents/Resources/bin/paperquire", target: "paperquire"

  zap trash: [
    "~/.paperquire",
    "~/Library/Application Support/PaperQuire",
    "~/Library/Caches/com.paperquire.app",
    "~/Library/Preferences/com.paperquire.app.plist",
  ]
end
