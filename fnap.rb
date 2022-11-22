class Fnap < Formula
   desc "Code snippets in your terminal"
   homepage "https://github.com/maaslalani/nap"
   url "https://github.com/maaslalani/nap/releases/download/v0.1.1/nap_0.1.1_darwin_arm64.tar.gz"
   sha256 "052575114be1b4aef4a9b2e4d58b95c0d2d0e4c8923bfdd39fdb76a3f1891dcf"
   license "MIT"
   head "https://github.com/maaslalani/nap.git", branch: "main"

   def install
     bin.install "#{buildpath}/nap"
   end

   test do
     assert_match "misc/Untitled Snippet.go", shell_output("#{bin}/nap list")
   end
 end
