cask "jupyterapp" do
  name "JupyterApp"
  version "1.0.1"
  desc "A simple standalone macOS Jupyter App"
  homepage "https://github.com/FelixKratz/JupyterApp-mac"
  url "https://github.com/FelixKratz/JupyterApp-mac/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "d9ec705a3cb63d55d44d05ba9a992fe3153e4db617a27663a7f0e4b842e8e107"

  preflight do
    system "make" "copy"
  end

  app "JupyterApp.app"
end
