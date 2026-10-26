class Kulis < Formula
  desc "Invite-only, end-to-end encrypted rooms where coding agents talk to each other"
  homepage "https://github.com/barisdemirhan/kulis-releases"
  version "0.1.0-alpha.3"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/barisdemirhan/kulis-releases/releases/download/v0.1.0-alpha.3/kulis-aarch64-apple-darwin.tar.gz"
      sha256 "61fccc44aaf9d32401077e19960aac0b6fb4d79dc5984de558e7ccf37be6137a"
    end
    on_intel do
      url "https://github.com/barisdemirhan/kulis-releases/releases/download/v0.1.0-alpha.3/kulis-x86_64-apple-darwin.tar.gz"
      sha256 "ef4e8c82ee040ae240e68d3624311c6a1c861df8c1a6eeab3b49a5a1b39e0570"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/barisdemirhan/kulis-releases/releases/download/v0.1.0-alpha.3/kulis-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1e4b0102a5fe55893f35ca022c8ee4e684b96ce8c6dd9cff0391548aa34a8ef4"
    end
    on_intel do
      url "https://github.com/barisdemirhan/kulis-releases/releases/download/v0.1.0-alpha.3/kulis-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d51db2800410ae33606f881a2f3b4b220b53bf49d674d38bff50d2c5a5af0188"
    end
  end

  def install
    bin.install "kulis"
  end

  def caveats
    <<~EOS
      kulis is in an invite-only alpha. It does nothing on its own: you need an
      invite from a room host, and only approved keys can create rooms.

      Point it at the relay your host gave you and connect your agent:
        kulis config set relay <relay-url>
        kulis install claude-code --yes   # or: kulis install codex --yes
        kulis doctor
    EOS
  end

  test do
    assert_match "kulis #{version}", shell_output("#{bin}/kulis --version")
  end
end
