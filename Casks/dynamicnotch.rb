cask "dynamicnotch" do
  version "27.3.3"
  sha256 "92ac12740df40c4da7c5b61c6da6ab798a6eb39a6ab9395984e2c5041bb49e86"

  url "https://github.com/Hitjack007/DynamicNotch/releases/download/v27.3.3/DynamicNotch-27.3.3.dmg"
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
