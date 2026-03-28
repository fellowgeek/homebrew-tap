cask "weblet" do
  version "1.0"
  sha256 "d19ec3578874191c718bff79bf7788ebebb5a8a88baaa3ab52ddc1bed20bee96"

  url "https://github.com/fellowgeek/weblet/releases/download/v#{version}/weblet.dmg"
  name "weblet"
  desc "A lightweight macOS web view application that can be launched and configured via command-line arguments."
  homepage "https://github.com/fellowgeek/weblet"

  app "weblet.app"

  # Creates a shim script so 'weblet' works in the terminal
  binary "weblet-wrapper", target: "weblet"

  # This block creates the actual executable script during installation
  preflight do
    File.write "#{staged_path}/weblet_wrapper", <<~SH
      #!/bin/sh
      # This launches the app via the macOS Launch Services
      open -a "#{appdir}/weblet.app" "$@"
    SH
  end

  # Makes the shim script executable
  postflight do
    system_command "/bin/chmod", args: ["+x", "#{staged_path}/weblet_wrapper"], sudo: false
  end

  zap trash: [
    "~/Library/Application Support/weblet",
    "~/Library/Preferences/com.weblet.fellowgeek.enClose.plist",
    "~/Library/Saved Application State/com.weblet.fellowgeek.enClose.savedState",
  ]
end
