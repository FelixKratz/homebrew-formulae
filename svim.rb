# typed: false

# frozen_string_literal: true

# svim.rb
class Svim < Formula
  env :std
  desc "Turns macOS input fields into real vim buffers"
  homepage "https://github.com/FelixKratz/SketchyVim"
  url "https://github.com/FelixKratz/SketchyVim/releases/download/v1.0.10/bundle_1.0.10.tgz"
  sha256 "7987c3f0894ed5e2e137316792bcf861c0c7086765a5a358ecd39bf42212573b"
  license "GPL-3.0-only"
  head "https://github.com/FelixKratz/SketchyVim.git"

  def clear_env
    ENV.delete("CFLAGS")
    ENV.delete("LDFLAGS")
    ENV.delete("CXXFLAGS")
  end


  def install
    if build.head?
      clear_env
      system "make"
      system "cp", "bin/svim", "svim"
      system "cp", "examples/svim.sh", "svim.sh"
      system "cp", "examples/blacklist", "blacklist"
      system "cp", "examples/svimrc", "svimrc"
    end

    bin.install "#{buildpath}/svim"
    (pkgshare/"examples").install "#{buildpath}/svimrc"
    (pkgshare/"examples").install "#{buildpath}/blacklist"
    (pkgshare/"examples").install "#{buildpath}/svim.sh"
  end

  def caveats
    <<~EOS
      Copy the example configuration into your home directory and make the script executable:
        mkdir ~/.config/svim
        cp #{opt_pkgshare}/examples/* ~/.config/svim/
        chmod +x ~/.config/svim/svim.sh
    EOS
  end

  service do
    run "#{opt_bin}/svim"
    environment_variables PATH: std_service_path_env
    keep_alive true
    process_type :interactive
  end

  test do
    echo "Have fun!\n"
  end
end
