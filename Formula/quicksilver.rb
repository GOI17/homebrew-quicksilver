class Quicksilver < Formula
  desc "Minimal Neovim configuration with fuzzy finding and terminal integration"
  homepage "https://github.com/GOI17/quicksilver"
  url "https://github.com/GOI17/quicksilver/releases/download/v0.1.0/quicksilver-0.1.0.tar.gz"
  sha256 "d8c8d1a289626c57ff2f3fd5a7e09dbc14be7f08a22e26e5dbcc00c14346be92"
  license "MIT"

  depends_on "git"
  depends_on "neovim"
  depends_on "ripgrep"

  def install
    libexec.install "bin", "init.lua", "lua", "lazy-lock.json", "VERSION"
    bin.install_symlink libexec/"bin/quicksilver"
  end

  def caveats
    <<~EOS
      Run quicksilver to start. Plugins install automatically on the first launch.
      Use :Mason inside Quicksilver to install language servers.

      If you previously installed from source, remove the quicksilver alias
      from your shell configuration so it uses this Homebrew command.
    EOS
  end

  test do
    assert_match "Quicksilver v#{version}", shell_output("#{bin}/quicksilver --version")
    assert_path_exists libexec/"lua/quicksilver/telescope/hints.lua"
    assert_path_exists libexec/"lua/quicksilver/terminal/hints.lua"
    output = shell_output(
      "#{bin}/quicksilver --headless -u NONE -i NONE " \
      "--cmd 'lua io.stdout:write(vim.env.NVIM_APPNAME)' +qa! 2>&1",
    )
    assert_equal "quicksilver", output.strip
  end
end
