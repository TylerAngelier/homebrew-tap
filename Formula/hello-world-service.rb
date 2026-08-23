class HelloWorldService < Formula
  desc "Print hello world once per minute as a background service"
  homepage "https://github.com/TylerAngelier/homebrew-tap"
  url "https://github.com/TylerAngelier/homebrew-tap/releases/download/v0.1.0/hello-world-service-0.1.0.tar.gz"
  sha256 "cbf10944878fcffd7b67036759600e10b1bac14efb167b5f659336d6ae93d98a"
  license "MIT"

  def install
    bin.install "hello-world-service"
  end

  service do
    run opt_bin/"hello-world-service"
    keep_alive true
    log_path var/"log/hello-world-service.log"
    error_log_path var/"log/hello-world-service-error.log"
  end

  test do
    assert_equal "hello world!\n", shell_output("#{bin}/hello-world-service --once")
  end
end
