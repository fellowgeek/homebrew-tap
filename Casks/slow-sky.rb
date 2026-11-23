cask "slow-sky" do
  version "1.0"
  sha256 "14d1a93d8cefe362d36efa651d66ae1b444598eecb002a89c9b451bb3224838c"

  url "https://github.com/fellowgeek/slow-sky/releases/download/v#{version}/slow-sky.dmg"
  name "slow-sky"
  desc ""
  homepage "https://github.com/fellowgeek/slow-sky"

  depends_on macos: ">= :sonoma"

  app "Slow Sky.app"

  zap trash: [
    "~/Library/Application Support/slow-sky",
    "~/Library/Preferences/slow-sky.fellowgeek.plist",
    "~/Library/Saved Application State/slow-sky.fellowgeek.savedState",
  ]
end