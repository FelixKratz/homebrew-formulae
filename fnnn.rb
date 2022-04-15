# typed: false

# frozen_string_literal: true

# fnnn.rb
class Fnnn < Formula
  env :std
  desc "Fork of nnn for my personal use"
  homepage "https://github.com/FelixKratz/nnn"
  head "https://github.com/FelixKratz/nnn.git"

  def clear_env
    ENV.delete("CFLAGS")
    ENV.delete("LDFLAGS")
    ENV.delete("CXXFLAGS")
  end

  def install
    clear_env
    system "make"
    bin.install "#{buildpath}/nnn"
  end
end
