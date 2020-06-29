class Validns < Formula
  homepage "http://www.validns.net/"
  url "https://github.com/DENICeG/validns/archive/5ca9faac7942019e2151db250f01d0a87f1eb388.zip"
  sha256 "54150b1ce82b2e15efcecf5074fbbf1c991f7095c2ed64431167ecb8a826a9db"
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
