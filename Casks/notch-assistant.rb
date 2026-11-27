cask "notch-assistant" do
  # renovate: datasource=custom.notch-assistant-releases depName=shmileee/notch-assistant
  version "0.5.1"
  sha256 "09e636a207b09ccc1fe1fb0b70195702b9c4ecf41efba23e0c17b08234ab12f6"

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

  # Signed with the project's own certificate, not notarized.
  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "{{appdir}}/Notch Assistant.app"],
        must_succeed: false
  end

  uninstall quit: "io.github.shmileee.notch-assistant"

  # API keys and tokens stay in the Keychain (service "notch-assistant"); remove them in Settings first.
  zap script: {
        executable:   "#{appdir}/Notch Assistant.app/Contents/MacOS/notch-assistant",
        args:         ["--login", "off"],
        must_succeed: false,
      },
      trash:  "~/Library/Application Support/notch-assistant"
end
