cask "jupyterapp" do
  name "JupyterApp"
  desc "A simple standalone macOS Jupyter App"
  homepage "https://github.com/FelixKratz/JupyterApp-mac"
  url "https://github.com/FelixKratz/JupyterApp-mac/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "d5ff604267a6ad6465651830b2eb66647f8665dbc01355ab21881eff255c9084"

  preflight do
    system "make"
  end

  app "#{buildpath}/Products/Applications/JupyterApp.app"
  end
end
