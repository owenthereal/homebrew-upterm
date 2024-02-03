# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Upterm < Formula
  desc "Instant Terminal Sharing"
  homepage "https://upterm.dev"
  version "0.13.2"
  license "Apache 2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/owenthereal/upterm/releases/download/v0.13.2/upterm_darwin_arm64.tar.gz"
      sha256 "0228000df02d032c94a73da4671f27c70ce3caeed4ae6cbaaaf7431ae80a8497"

      def install
        bin.install "upterm"
        man1.install Dir["etc/man/man1/upterm*.1"]
        generate_completions_from_executable(bin/"upterm", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/owenthereal/upterm/releases/download/v0.13.2/upterm_darwin_amd64.tar.gz"
      sha256 "f924edcb4b099776005c287ecffcaf4ee90fb8cb97891dfb92c52d93148284a9"

      def install
        bin.install "upterm"
        man1.install Dir["etc/man/man1/upterm*.1"]
        generate_completions_from_executable(bin/"upterm", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/owenthereal/upterm/releases/download/v0.13.2/upterm_linux_armv6.tar.gz"
      sha256 "d00414f741e6cfc1dc52adace25e6fd595252205ef73855e7c0c14b9176c6ccb"

      def install
        bin.install "upterm"
        man1.install Dir["etc/man/man1/upterm*.1"]
        generate_completions_from_executable(bin/"upterm", "completion")
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/owenthereal/upterm/releases/download/v0.13.2/upterm_linux_arm64.tar.gz"
      sha256 "24d2103a87e683c3cc49cf34d5220b6be5faeff14629083161aacf1ac0b1cce2"

      def install
        bin.install "upterm"
        man1.install Dir["etc/man/man1/upterm*.1"]
        generate_completions_from_executable(bin/"upterm", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/owenthereal/upterm/releases/download/v0.13.2/upterm_linux_amd64.tar.gz"
      sha256 "f6a31d4a7464631b0893df7583bdcf1d44be1e1e2caec9056a2d2fef81df93c3"

      def install
        bin.install "upterm"
        man1.install Dir["etc/man/man1/upterm*.1"]
        generate_completions_from_executable(bin/"upterm", "completion")
      end
    end
  end

  head "https://github.com/owenthereal/upterm.git"

  test do
    assert_match(/Upterm version/, shell_output("#{bin}/upterm version"))
  end
end
