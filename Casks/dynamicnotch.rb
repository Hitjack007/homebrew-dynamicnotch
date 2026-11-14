cask "dynamicnotch" do
  version "27.5.2"
  sha256 "00dea11e68e29aa24760ab63b32e43e61c8e0070f24b50e86a93a021d2da05ef"

  url "https://github.com/Hitjack007/DynamicNotch/releases/download/v27.5.2/DynamicNotch-27.5.2.dmg"
  name "DynamicNotch"
  desc "Turns the MacBook notch into a live system dashboard"
  homepage "https://github.com/Hitjack007/DynamicNotch"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sequoia

  app "DynamicNotch.app"

  postflight_steps do
    if_path_exists "DynamicNotch.app", base: :appdir do
      run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/DynamicNotch.app"]
    end
  end

  uninstall quit: "com.mark.dynamicnotch"

  zap trash: [
    "~/Library/Application Scripts/com.mark.dynamicnotch/",
    "~/Library/Containers/com.mark.dynamicnotch/",
  ]
end
