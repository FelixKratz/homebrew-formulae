# typed: false

# frozen_string_literal: true

# sketchybar.rb
class Sketchybar < Formula
  env :std
  desc "Custom macOS statusbar with shell plugin, interaction and graph support"
  homepage "https://github.com/FelixKratz/SketchyBar"
  url "https://github.com/FelixKratz/SketchyBar/archive/refs/tags/v2.14.4.tar.gz"
  sha256 "cd928cad51daf8b4fdab2d83c996f43656e01c23a4d994bc0b605cd5e0d74ae2"
  license "GPL-3.0-only"
  head "https://github.com/FelixKratz/SketchyBar.git"

  def clear_env
    ENV.delete("CFLAGS")
    ENV.delete("LDFLAGS")
    ENV.delete("CXXFLAGS")
  end

  def install
    clear_env
    (var/"log/sketchybar").mkpath
    if MacOS.version < 11
      system "make", "x86"
    else
      system "make"
    end

    system "codesign", "--force", "-s", "-", "#{buildpath}/bin/sketchybar"
    bin.install "#{buildpath}/bin/sketchybar"
    (pkgshare/"examples").install "#{buildpath}/sketchybarrc"
    (pkgshare/"examples").install "#{buildpath}/plugins/"
  end

  def caveats
    <<~EOS
      Copy the example configuration into your home directory and make the scripts executable:
        mkdir ~/.config/sketchybar
        cp #{opt_pkgshare}/examples/sketchybarrc ~/.config/sketchybar/sketchybarrc
        mkdir ~/.config/sketchybar/plugins
        cp -r #{opt_pkgshare}/examples/plugins/ ~/.config/sketchybar/plugins/
        chmod +x ~/.config/sketchybar/plugins/*
    EOS
  end

  service do
    run "#{opt_bin}/sketchybar"
    environment_variables PATH: std_service_path_env, LANG: "en_US.UTF-8"
    keep_alive true
    process_type :interactive
  end

  test do
    echo "To test your installation run: sketchybar -v \n"
  end
end
