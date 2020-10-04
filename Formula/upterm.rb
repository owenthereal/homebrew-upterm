class Upterm < Formula
  desc "Secure terminal sharing"
  homepage "https://upterm.dev"
  url "https://github.com/owenthereal/upterm/archive/v0.4.6.tar.gz"
  sha256 "d3bc5231ededc43c31a723707767ed4a6e22c87c38adb402a2aa564cf3a42e82"
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
