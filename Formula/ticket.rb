class Ticket < Formula
  desc "Minimal ticket tracking with hierarchical list view"
  homepage "https://github.com/TylerAngelier/ticket"
  url "https://github.com/TylerAngelier/ticket/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "96035ea690e62a5700f6868b03ec0f97e7e8d99cb95053d9d9a0ad62e80fb028"
  license "MIT"

  depends_on "go" => :build

  def install
    # Core CLI + alias
    bin.install "ticket" => "tk"
    bin.install_symlink "tk" => "ticket"

    # Compiled Go plugin backing ls/list/ready/blocked
    system "go", "build", "-trimpath", "-o", "ticket-ls", "./cmd/ticket-ls"
    bin.install "ticket-ls"
    ["ticket-list", "ticket-ready", "ticket-blocked"].each do |name|
      bin.install_symlink "ticket-ls" => name
    end

    # Bash plugins (regular files only; symlinks were release-time aliases)
    Dir["plugins/ticket-*"].each do |plugin|
      bin.install plugin unless File.symlink?(plugin)
    end
  end

  test do
    system "#{bin}/tk", "help"
    assert_match "tk-plugin-version:",
                 shell_output("#{bin}/ticket-ls --tk-describe")
  end
end
