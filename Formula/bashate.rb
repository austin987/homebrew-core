class Bashate < Formula
  include Language::Python::Virtualenv

  desc "A pep8 equivalent for bash scripts"
  homepage "https://github.com/openstack-dev/bashate"
  # Use pypi instead of github to avoid sdist errors during install
  url "https://pypi.python.org/packages/22/3c/10efc0119b59e77c74e94eb9768f409b4ba25238a0e3082203bc5386793f/bashate-0.5.1.tar.gz"
  sha256 "bcb2911c013f5d6d27413624e062079b7a6ec056581960b4a81cea72975d8434"

  depends_on :python

  resource "Babel" do
    url "https://files.pythonhosted.org/packages/92/22/643f3b75f75e0220c5ef9f5b72b619ccffe9266170143a4821d4885198de/Babel-2.4.0.tar.gz"
    sha256 "8c98f5e5f8f5f088571f2c6bd88d530e331cbbcb95a7311a0db69d3dca7ec563"
  end

  resource "pytz" do
    url "https://files.pythonhosted.org/packages/a4/09/c47e57fc9c7062b4e83b075d418800d322caa87ec0ac21e6308bd3a2d519/pytz-2017.2.zip"
    sha256 "f5c056e8f62d45ba8215e5cb8f50dfccb198b4b9fbea8500674f3443e4689589"
  end

  resource "pbr" do
    url "https://files.pythonhosted.org/packages/18/2e/28a7d361a568b1a6c86946674e8ac35a609573c3a3d12bb20f6aaf1c39bf/pbr-3.0.1.tar.gz"
    sha256 "d7e8917458094002b9a2e0030ba60ba4c834c456071f2d0c1ccb5265992ada91"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    ENV.prepend_path "PYTHONPATH", lib/"python2.7/site-packages"
    system "#{bin}/bashate", "--help"
  end
end
