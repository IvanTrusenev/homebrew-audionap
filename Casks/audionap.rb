cask "audionap" do
  version "0.4.0"
  sha256 "6da964747b15f36a1c0739d724ce8a6f91934f7b72af33eb1fd68ba42af07c54"

  url "https://github.com/IvanTrusenev/audionap/releases/download/v#{version}/AudioNap-#{version}.zip"
  name "AudioNap"
  desc "Puts your Bluetooth speaker to sleep when you are away"
  homepage "https://github.com/IvanTrusenev/audionap"

  depends_on formula: "blueutil"
  depends_on macos: :sonoma

  app "AudioNap.app"

  uninstall launchctl: "online.threealab.audionap.daemon",
            quit:      "online.threealab.audionap"

  zap trash: [
    "~/Library/Application Support/AudioNap",
    "~/Library/LaunchAgents/online.threealab.audionap.daemon.plist",
    "~/Library/Logs/AudioNap",
  ]

  caveats <<~EOS
    AudioNap is ad-hoc signed and not notarized, so macOS blocks the first
    launch. Open System Settings > Privacy & Security and click "Open
    Anyway" next to the AudioNap entry (macOS 15 and later no longer offer
    the Finder right-click override). Repeat after every update.
  EOS
end
