class Upterm < Formula
  desc "Secure terminal sharing"
  homepage "https://upterm.dev"
  url "https://github.com/jingweno/upterm/archive/v0.3.1.tar.gz"
  sha256 "0a7ed4fdd304ead924cfac8345a348f24a9b929b013f7e1af291db2984c204e9"
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
    assert_match(/upterm version/, shell_output("#{bin}/upterm version"))
  end
end
