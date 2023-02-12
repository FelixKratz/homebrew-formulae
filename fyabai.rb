# typed: false

# frozen_string_literal: true

# fyabai.rb
class Fyabai < Formula
  env :std
  desc "Fork of Yabai for my personal use"
  homepage "https://github.com/FelixKratz/yabai"
  head "https://github.com/FelixKratz/yabai.git"

  depends_on :macos => :high_sierra

  def clear_env
    ENV.delete("CFLAGS")
    ENV.delete("LDFLAGS")
    ENV.delete("CXXFLAGS")
  end

  def install
    clear_env
    (var/"log/yabai").mkpath

    system "make", "-j1", "install"
    system "codesign", "--force", "-s", "-", "#{buildpath}/bin/yabai"

    bin.install "#{buildpath}/bin/yabai"
  end

  service do
    run "#{opt_bin}/yabai"
    environment_variables PATH: std_service_path_env
    keep_alive true
    process_type :interactive
  end

  test do
    echo "Hi\n"
  end
end
