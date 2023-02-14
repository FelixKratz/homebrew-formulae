# typed: false

# frozen_string_literal: true

# fyabai.rb
class Fskhd < Formula
  env :std
  desc "Fork of skhd for my personal use"
  homepage "https://github.com/FelixKratz/skhd"
  head "https://github.com/FelixKratz/skhd.git"

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
    system "codesign", "--force", "-s", "-", "#{buildpath}/bin/skhd"

    bin.install "#{buildpath}/bin/skhd"
  end

  service do
    run "#{opt_bin}/skhd"
    environment_variables PATH: std_service_path_env
    keep_alive true
    process_type :interactive
  end

  test do
    echo "Hi\n"
  end
end
