cask "weblet" do
  version "1.0"
  sha256 "d19ec3578874191c718bff79bf7788ebebb5a8a88baaa3ab52ddc1bed20bee96"

  url "https://github.com/fellowgeek/weblet/releases/download/v#{version}/weblet.dmg"
  name "weblet"
  desc "A lightweight macOS web view application that can be launched and configured via command-line arguments."
  homepage "https://github.com/fellowgeek/weblet"

  app "weblet.app"
  binary "#{appdir}/weblet.app/Contents/MacOS/weblet"

  zap trash: [
    "~/Library/Application Support/weblet",
    "~/Library/Preferences/com.weblet.fellowgeek.enClose.plist",
    "~/Library/Saved Application State/com.weblet.fellowgeek.enClose.savedState",
  ]
end
