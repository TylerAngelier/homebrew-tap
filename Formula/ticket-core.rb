class TicketCore < Formula
  desc "Minimal ticket tracking in bash (core only)"
  homepage "https://github.com/TylerAngelier/ticket"
  url "https://github.com/TylerAngelier/ticket/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "96035ea690e62a5700f6868b03ec0f97e7e8d99cb95053d9d9a0ad62e80fb028"
  license "MIT"

  def install
    bin.install "ticket" => "tk"
    bin.install_symlink "tk" => "ticket"
  end

  test do
    system "#{bin}/tk", "help"
  end
end
