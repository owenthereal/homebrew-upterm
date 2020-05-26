class Upterm < Formula
  desc "Secure terminal sharing"
  homepage "https://upterm.dev"
  url "https://github.com/jingweno/upterm/archive/v0.3.0.tar.gz"
  sha256 "b06683f7207089a608f9c3529453bb0263daebec48660fb46a5c6f65cc19a150"
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
