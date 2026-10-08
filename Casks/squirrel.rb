cask "squirrel" do
  version "1.0.0"
  sha256 "e8fcaf323c8fab8875268ba3b8ca9dae07c99bf5624d47f47ce44237a4bd8d22"

  # The cask version is the version of this bootstrap shim, not of the CLI.
  # The shim installs the regular squirrelscan install on first run; the CLI
  # then updates itself with `squirrel self update`.
  url "https://raw.githubusercontent.com/squirrelscan/homebrew-tap/v#{version}/squirrel-shim"
  name "squirrelscan"
  desc "Website QA tool for your coding agent (bootstraps the regular install)"
  homepage "https://squirrelscan.com"

  # Homebrew does not own the CLI: it updates itself, so never upgrade it here.
  auto_updates true

  binary "squirrel-shim", target: "squirrel"

  # `brew uninstall --cask squirrel` removes the managed install too (the
  # symlink and ~/.squirrel/releases). Settings and credentials stay unless the
  # user runs `brew uninstall --zap --cask squirrel`.
  uninstall script: {
    executable: "#{staged_path}/squirrel-shim",
    args:       ["__brew_uninstall"],
  }

  zap trash: "~/.squirrel"
end
