class Sketchybar < Formula
  desc "A custom macOS statusbar with shell plugin, interaction and graph support"
  homepage "https://github.com/FelixKratz/SketchyBar"
  url "https://github.com/FelixKratz/SketchyBar/archive/refs/tags/v1.0.8.tar.gz"
  sha256 "a005b6483d88b5e55f9fa625e9a9f57730906d5d3df2e105dc8ad8255f1d57d8"
  head "https://github.com/FelixKratz/SketchyBar.git"

  def install
    (var/"log/sketchybar").mkpath
    system "make"
    bin.install "#{buildpath}/bin/sketchybar"
    (pkgshare/"examples").install "#{buildpath}/sketchybarrc"
    (pkgshare/"examples").install "#{buildpath}/plugins/"
  end

  def caveats; <<~EOS
    Copy the example configuration into your home directory and make the scripts executable:
      mkdir ~/.config/sketchybar
      cp #{opt_pkgshare}/examples/sketchybarrc ~/.config/sketchybar/sketchybarrc
      mkdir ~/.config/sketchybar/plugins
      cp -r #{opt_pkgshare}/examples/plugins/ ~/.config/sketchybar/plugins/
      chmod +x ~/.config/sketchybar/plugins/*
    EOS
  end

  plist_options :manual => "sketchybar"

  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>Label</key>
      <string>#{plist_name}</string>
      <key>ProgramArguments</key>
      <array>
        <string>#{opt_bin}/sketchybar</string>
      </array>
      <key>EnvironmentVariables</key>
      <dict>
        <key>PATH</key>
        <string>#{HOMEBREW_PREFIX}/bin:/usr/bin:/bin:/usr/sbin:/sbin</string>
      </dict>
      <key>RunAtLoad</key>
      <true/>
      <key>KeepAlive</key>
      <true/>
      <key>StandardOutPath</key>
      <string>#{var}/log/sketchybar/sketchybar.out.log</string>
      <key>StandardErrorPath</key>
      <string>#{var}/log/sketchybar/sketchybar.err.log</string>
      <key>ProcessType</key>
      <string>Interactive</string>
      <key>Nice</key>
      <integer>-20</integer>
    </dict>
    </plist>
    EOS
  end
end
