cask "audionap" do
    version "0.1.0"
    sha256 "406a80e8e75aa93fc4bad635fc93785832c8f6ea19e11a862e01e67e733b3a18"
  
    url "https://github.com/IvanTrusenev/audionap/releases/download/v#{version}/AudioNap-#{version}.zip"
    name "AudioNap"
    desc "Puts your Bluetooth speaker to sleep when you are away"
    homepage "https://github.com/IvanTrusenev/audionap"
  
    depends_on formula: "blueutil"
    depends_on macos: ">= :sonoma"
  
    app "AudioNap.app"
  
    uninstall quit: "online.threealab.audionap",
              launchctl: "online.threealab.audionap.daemon"
  
    zap trash: [
      "~/Library/Application Support/AudioNap",
      "~/Library/Logs/AudioNap",
      "~/Library/LaunchAgents/online.threealab.audionap.daemon.plist",
    ]
  
    caveats <<~EOS
      AudioNap is ad-hoc signed and not notarized, so macOS blocks the first
      launch. Open System Settings > Privacy & Security and click "Open
      Anyway" next to the AudioNap entry (macOS 15 and later no longer offer
      the Finder right-click override). Repeat after every update.
    EOS
  end
  