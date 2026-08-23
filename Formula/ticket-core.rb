class TicketCore < Formula
  desc "Minimal ticket tracking in bash (core only)"
  homepage "https://github.com/TylerAngelier/ticket"
  url "https://github.com/TylerAngelier/ticket/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "15e0a84940d2f92cdda228d8b46b5c90aad12ed0b2c3fbdd18d18c97d309ba60"
  license "MIT"

  def install
    bin.install "ticket" => "tk"
    bin.install_symlink "tk" => "ticket"
  end

  test do
    system "#{bin}/tk", "help"
  end
end
