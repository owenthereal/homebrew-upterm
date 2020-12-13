class Upterm < Formula
  desc "Secure terminal sharing"
  homepage "https://upterm.dev"
  url "https://github.com/owenthereal/upterm/archive/v0.5.2.tar.gz"
  sha256 "4da96e79816cc18c4417edbb99f6216fe9f21219b78b42f19ae4795c0716829e"
  head "https://github.com/owenthereal/upterm.git"

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
