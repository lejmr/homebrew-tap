class HerdrLidAwake < Formula
  desc "Keep the Mac running with the lid closed while the Herdr UI cup is on"
  homepage "https://github.com/lejmr/herdr-lid-awake"
  # The release workflow of herdr-lid-awake rewrites url and sha256 on every tag.
  url "https://github.com/lejmr/herdr-lid-awake/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "3a7f944a073004b677e5b1887613cb081967515ec519166a15ab1d2caa7cf488"
  license "BSD-3-Clause"

  depends_on :macos

  def install
    bin.install "herdr-lid-awake"
  end

  service do
    run opt_bin/"herdr-lid-awake"
    keep_alive true
    log_path var/"log/herdr-lid-awake.log"
    error_log_path var/"log/herdr-lid-awake.log"
  end

  def caveats
    <<~EOS
      The watcher needs a sudoers rule for `pmset disablesleep 0|1`.
      Install it once (asks for your password, validated with visudo):
        herdr-lid-awake install-sudoers
      (one file per account: /etc/sudoers.d/herdr-lid-awake-<uid>)
      Then start the watcher:
        brew services start herdr-lid-awake
      To remove: stop the service first, then delete that sudoers file and
        ~/.local/state/herdr-lid-awake
    EOS
  end

  test do
    assert_match "herdr-lid-awake #{version}", shell_output("#{bin}/herdr-lid-awake --version")
    assert_match "NOPASSWD: /usr/bin/pmset disablesleep 0, /usr/bin/pmset disablesleep 1",
                 shell_output("#{bin}/herdr-lid-awake sudoers")
    shell_output("#{bin}/herdr-lid-awake bogus 2>&1", 2)
  end
end
