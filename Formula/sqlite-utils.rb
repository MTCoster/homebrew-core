class SqliteUtils < Formula
  include Language::Python::Virtualenv
  desc "CLI utility for manipulating SQLite databases"
  homepage "https://sqlite-utils.readthedocs.io/"
  url "https://files.pythonhosted.org/packages/91/c8/c9caccfb59f9deac5e160a2d7a9c15e631d455cf27c48165189de644a8e3/sqlite-utils-2.15.1.tar.gz"
  sha256 "ca71a92bb96304323edc5b0fd1130f93d0ffe5083cd5a99b67e596efafee7220"
  license "Apache-2.0"

  bottle do
    cellar :any_skip_relocation
    sha256 "a9aaa8993db03cb02d098db5306e20062ad04dc25a1e865102777085f896569f" => :catalina
    sha256 "9f40080117f341c131d723177c431a8b15d428e557c879f7c4700cfdc57128da" => :mojave
    sha256 "9e2e6ecf7cb859efb4772e953a0f3f6b7ecc5ffd9a9eeacaae4d28e7bde9b67f" => :high_sierra
  end

  depends_on "python@3.8"

  resource "click" do
    url "https://files.pythonhosted.org/packages/27/6f/be940c8b1f1d69daceeb0032fee6c34d7bd70e3e649ccac0951500b4720e/click-7.1.2.tar.gz"
    sha256 "d2b5255c7c6349bc1bd1e59e08cd12acbbd63ce649f2588755783aa94dfb6b1a"
  end

  resource "click-default-group" do
    url "https://files.pythonhosted.org/packages/22/3a/e9feb3435bd4b002d183fcb9ee08fb369a7e570831ab1407bc73f079948f/click-default-group-1.2.2.tar.gz"
    sha256 "d9560e8e8dfa44b3562fbc9425042a0fd6d21956fcc2db0077f63f34253ab904"
  end

  resource "tabulate" do
    url "https://files.pythonhosted.org/packages/57/6f/213d075ad03c84991d44e63b6516dd7d185091df5e1d02a660874f8f7e1e/tabulate-0.8.7.tar.gz"
    sha256 "db2723a20d04bcda8522165c73eea7c300eda74e0ce852d9022e0159d7895007"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "15", shell_output("#{bin}/sqlite-utils :memory: 'select 3 * 5'")
  end
end
