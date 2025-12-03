cask "noteminder" do
  version "1.1.5"
  sha256 :no_check

  url "https://github.com/hypn05/NoteMinder/releases/download/v#{version}/NoteMinder-#{version}#{Hardware::CPU.intel? ? "" : "-arm64"}.dmg",
      verified: "github.com/hypn05/NoteMinder/"

  name "NoteMinder"
  desc "Desktop note-taking application with collapsible sidebar"
  homepage "https://github.com/hypn05/NoteMinder"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  app "NoteMinder.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/NoteMinder.app"],
                   sudo: true
  end

  zap trash: [
    "~/Library/Application Support/noteminder",
    "~/Library/Preferences/com.noteminder.app.plist",
    "~/Library/Saved Application State/com.noteminder.app.savedState",
  ]
end
