cask "jupyterapp" do
  name "JupyterApp"
  version "1.0.1"
  desc "A simple standalone macOS Jupyter App"
  homepage "https://github.com/FelixKratz/JupyterApp-mac"
  url "https://github.com/FelixKratz/JupyterApp-mac/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "d27582fcfce6242f2f78beeffbb70c39c983fc7661976d6111bf1efda53330d3"
  installer script: "make"

  app "JupyterApp.app"
end
