class Upterm < Formula
  desc "Secure terminal sharing"
  homepage "https://upterm.dev"
  url "https://github.com/jingweno/upterm/archive/v0.4.4.tar.gz"
  sha256 "edded921e6a120873c9be56eb9a8cd285f1484cf5fe706ab1323993846f188a9"
  head "https://github.com/jingweno/upterm.git"

  depends_on "go" => :build

  def install
    system "make", "build"
    bin.install "build/upterm"

    prefix.install_metafiles

    bash_completion.install "etc/completion/upterm.bash_completion.sh"
    zsh_completion.install "etc/completion/upterm.zsh_completion" => "_upterm"

    man.install "etc/man/man1"
  end

  test do
    assert_match(/Upterm version/, shell_output("#{bin}/upterm version"))
  end
end
