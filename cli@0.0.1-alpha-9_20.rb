# THIS IS A GENERATED FILE, DO NOT EDIT. GENERATED BY https://github.com/onmetal-dev/metal/actions/workflows/release.yml
class CliAT001Alpha920 < Formula
  desc "The missing PaaS for Hetzner"
  homepage "https://github.com/onmetal-dev/metal"
  version "v0.0.1-alpha-9_20"
  base_url = "https://github.com/onmetal-dev/metal/releases/download/#{version}"

  # Each release of the Metal CLI contains binaries for MacOS, Linux etc compressed into
  # separate .tar.gz files. So no building of source code is necessary. We only need
  # to download, verify and install those binaries. That's why we use bin.install.
  # For more info on that method, see:
  # https://docs.brew.sh/Formula-Cookbook#bininstall-foo

  on_macos do
    if Hardware::CPU.arm?
      url "#{base_url}/metal-#{version}-darwin-arm64.tar.gz"
      sha256 "fb6c1514b6d40e1a979b854108a763e26fcd9760b8920ea6daba3937bbace69c"

      def install
        command_name = "metal-#{version}-darwin-arm64"
        bin.install command_name
        # Inspired by: https://github.com/argoproj/homebrew-tap/blob/e8b04ee8b260b5675cd646d8acbbe3e32a9924f5/kubectl-argo-rollouts%401.2.rb#L21
        mv bin/ + command_name.to_s, bin/"metal"
      end
    end

    if Hardware::CPU.intel?
      url "#{base_url}/metal-#{version}-darwin-x64.tar.gz"
      sha256 "e10a284d7a4b6ae8a86bdbe7369310230da6ac3a0b170b3688df38cd02ad1c01"


      def install
        command_name = "metal-#{version}-darwin-x64"
        bin.install "metal-#{version}-darwin-x64"
        mv bin/ + command_name.to_s, bin/"metal"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{base_url}/metal-#{version}-linux-arm64.tar.gz"
      sha256 "fe5e7082380c0167f5c38b4115cdb3ee62a82c24595fac553cb8d73593dc6a43"

      def install
        command_name = "metal-#{version}-linux-arm64"
        bin.install "metal-#{version}-linux-arm64"
        mv bin/ + command_name.to_s, bin/"metal"
      end
    end

    if Hardware::CPU.intel?
      url "#{base_url}/metal-#{version}-linux-x64.tar.gz"
      sha256 "25db0cfac279fc98a1a64eeba3192a6c932e3612f09722f92b4511036c9d6837"

      def install
        command_name = "metal-#{version}-linux-x64"
        bin.install "metal-#{version}-linux-x64"
        mv bin/ + command_name.to_s, bin/"metal"
      end
    end
  end

  test do
    system "#{bin}/metal", "--version"
    system "metal", "--version"
  end
end
