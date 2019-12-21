class Validns < Formula
  homepage "http://www.validns.net/"
  url "https://github.com/DENICeG/validns/archive/2bfecb3aa82db2f7595de9db0d08d58dccd71a2e.zip"
  sha256 "e190a1ac19167a77a4965936c36e2323d1f382a575ed3294aa101de469fe5368"
  version "0.8"

  depends_on "fhemberger/validns/judy"
  depends_on "openssl"

  def install
    system "make"
    bin.install "validns"
    man1.install "validns.1"
  end

  test do
    (testpath/"example.com").write("example.com. IN SOA ns.example.com. hostmaster.example.com. 9 10800 3600 604800 3600")
    assert_match /ttl not specified and default is not known/, shell_output("#{bin}/validns example.com 2>&1", 1)
  end
end
