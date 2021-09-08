cask "jupyterapp" do
  name "JupyterApp"
  version "1.0.1"
  desc "A simple standalone macOS Jupyter App"
  homepage "https://github.com/FelixKratz/JupyterApp-mac"
  url "https://github.com/FelixKratz/JupyterApp-mac/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "103210d9ac97f0b5914c022c58d594417d354c05d221a7cf710a6db98ee9df69"

  preflight do
    system "make"
  end

  app "JupyterApp.app"
end
