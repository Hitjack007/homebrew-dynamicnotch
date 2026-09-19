cask "dynamicnotch" do
  version "27.1"
  sha256 "25423511f9bd6b631b24405b16f07100dafdf233b2a27fe76690f944e0829656"

  url "https://github.com/Hitjack007/DynamicNotch/releases/download/v27.1/DynamicNotch-27.1.dmg"
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
