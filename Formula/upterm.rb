# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Upterm < Formula
  desc "Secure terminal sharing"
  homepage "https://upterm.dev"
  version "0.6.6"
  license "Apache 2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/owenthereal/upterm/releases/download/v0.6.6/upterm_darwin_arm64.tar.gz"
      sha256 "06ec8b2e7d101a88fe8e3c003c9a77f96c00473cd93d26fd03f900b7fae29e4f"

      def install
        bin.install "upterm"
        prefix.install_metafiles
        bash_completion.install "etc/completion/upterm.bash_completion.sh"
        zsh_completion.install "etc/completion/upterm.zsh_completion" => "_upterm"
        man.install "etc/man/man1"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/owenthereal/upterm/releases/download/v0.6.6/upterm_darwin_amd64.tar.gz"
      sha256 "9f96796d8a27975705ba5b3994b5698e645ce0a9044259389ecddaa300d381af"

      def install
        bin.install "upterm"
        prefix.install_metafiles
        bash_completion.install "etc/completion/upterm.bash_completion.sh"
        zsh_completion.install "etc/completion/upterm.zsh_completion" => "_upterm"
        man.install "etc/man/man1"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/owenthereal/upterm/releases/download/v0.6.6/upterm_linux_amd64.tar.gz"
      sha256 "8194f6701e8edc91d52465819599e71b48f1eb6ae800c3a14016564bbb130cfe"

      def install
        bin.install "upterm"
        prefix.install_metafiles
        bash_completion.install "etc/completion/upterm.bash_completion.sh"
        zsh_completion.install "etc/completion/upterm.zsh_completion" => "_upterm"
        man.install "etc/man/man1"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/owenthereal/upterm/releases/download/v0.6.6/upterm_linux_arm64.tar.gz"
      sha256 "55825ee21fdd10fdc46de95001e5bf81973f722e094d52c14c54cde8ba4a4f6d"

      def install
        bin.install "upterm"
        prefix.install_metafiles
        bash_completion.install "etc/completion/upterm.bash_completion.sh"
        zsh_completion.install "etc/completion/upterm.zsh_completion" => "_upterm"
        man.install "etc/man/man1"
      end
    end
  end

  head "https://github.com/owenthereal/upterm.git"

  test do
    assert_match(/Upterm version/, shell_output("#{bin}/upterm version"))
  end
end
