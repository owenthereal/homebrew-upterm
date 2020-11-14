class Upterm < Formula
  desc "Secure terminal sharing"
  homepage "https://upterm.dev"
  url "https://github.com/owenthereal/upterm/archive/v0.5.0.tar.gz"
  sha256 "ab775c5b42b3da1b0cde642d419352aabd4233a64c5d7c1e9ebc1bc72be0d6e8"
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
