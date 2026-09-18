cask "dynamicnotch" do
  version "27.0.1"
  sha256 "7da3ed1d1c091e3ffa7566bb4c1a87843a5374241321d6bcf31484566e91d4c2"

  url "https://github.com/Hitjack007/DynamicNotch/releases/download/v#{version}/DynamicNotch-#{version}.dmg"
  name "DynamicNotch"
  desc "Turns the MacBook notch into a live system dashboard"
  homepage "https://github.com/Hitjack007/DynamicNotch"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :sequoia"

  app "DynamicNotch.app"

  postflight do
    app_path = appdir/"DynamicNotch.app"
    next unless app_path.exist?
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", app_path]
  end

  uninstall quit: "com.mark.dynamicnotch"

  zap trash: [
    "~/Library/Application Scripts/com.mark.dynamicnotch/",
    "~/Library/Containers/com.mark.dynamicnotch/",
  ]
end
