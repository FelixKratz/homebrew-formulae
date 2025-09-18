# typed: false

# frozen_string_literal: true

# borders.rb
class Borders < Formula
  env :std
  desc "A window border system for macOS"
  homepage "https://github.com/FelixKratz/JankyBorders"
  url "https://github.com/FelixKratz/JankyBorders/archive/refs/tags/v1.8.2.tar.gz"
  sha256 "e1616c8654df0304f6edd6d279f999fe40eccbcce694ac5fdb799e832ca49510"
  license "GPL-3.0-only"
  head "https://github.com/FelixKratz/JankyBorders.git", branch: "main"

  depends_on :macos => :sonoma

  def clear_env
    ENV.delete("CFLAGS")
    ENV.delete("LDFLAGS")
    ENV.delete("CXXFLAGS")
  end

  def install
    clear_env
    (var/"log/jankyborders").mkpath
    system "make"

    system "codesign", "--force", "-s", "-", "#{buildpath}/bin/borders"
    bin.install "#{buildpath}/bin/borders"

    man.mkpath
    man1.install "#{buildpath}/docs/borders.1"
  end

  service do
    run "#{opt_bin}/borders"
    environment_variables PATH: std_service_path_env, LANG: "en_US.UTF-8"
    keep_alive true
    process_type :interactive
    log_path "#{var}/log/borders/borders.out.log"
    error_log_path "#{var}/log/borders/borders.err.log"
  end

  test do
    echo "To test your installation run: borders \n"
  end
end
