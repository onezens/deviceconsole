class Deviceconsole < Formula
  desc "An iOS system log tailer that doesn't suck. Improved"
  homepage "https://github.com/onezens/deviceconsole"
  url "https://github.com/onezens/deviceconsole/archive/1.0.2.tar.gz"
  sha256 "10b3a444a2e81f5d86495176e0d86fc3510e19836f5b8665f87bc3d2cd1e02c2"
  def install
    system "make", "install", "CC=#{ENV.cc}", "PREFIX=#{prefix}"
  end

  test do
    system "deviceconsole -h"
  end
end
