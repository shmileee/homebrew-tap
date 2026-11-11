cask "notch-assistant" do
  # renovate: datasource=custom.notch-assistant-releases depName=shmileee/notch-assistant
  version "0.1.2"
  sha256 "c4f4109d4abe85f455a53cd5a735347fdf047db452e3415cebf35b83a38085a7"

  url "https://github.com/shmileee/notch-assistant/releases/download/v#{version}/NotchAssistant-#{version}-arm64.zip"
  name "Notch Assistant"
  desc "Dynamic-Island-style panel for the MacBook notch"
  homepage "https://github.com/shmileee/notch-assistant"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Notch Assistant.app"

  # Ad-hoc signed, not notarized.
  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "{{appdir}}/Notch Assistant.app"],
        must_succeed: false
  end

  uninstall quit: "io.github.shmileee.notch-assistant"

  # The API key stays in the Keychain (service "notch-assistant"); remove it in Settings first.
  zap script: {
        executable:   "#{appdir}/Notch Assistant.app/Contents/MacOS/notch-assistant",
        args:         ["--login", "off"],
        must_succeed: false,
      },
      trash:  "~/Library/Application Support/notch-assistant"
end
