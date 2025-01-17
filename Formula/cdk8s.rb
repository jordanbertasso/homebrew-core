require "language/node"

class Cdk8s < Formula
  desc "Define k8s native apps and abstractions using object-oriented programming"
  homepage "https://cdk8s.io/"
  url "https://registry.npmjs.org/cdk8s-cli/-/cdk8s-cli-2.1.51.tgz"
  sha256 "3f9b44190cb42a15badbb6d896eb39311709d814d80264532e4fba2aa1ef71c8"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "13f8498262ac7fdddfad69b8c98c995054b430d24d96f82f87b83b30a03756e1"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "Cannot initialize a project in a non-empty directory",
      shell_output("#{bin}/cdk8s init python-app 2>&1", 1)
  end
end
