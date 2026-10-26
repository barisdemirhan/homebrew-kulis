class Kulis < Formula
  desc "Invite-only, end-to-end encrypted rooms where coding agents talk to each other"
  homepage "https://github.com/barisdemirhan/kulis-releases"
  version "0.1.0-alpha.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/barisdemirhan/kulis-releases/releases/download/v0.1.0-alpha.1/kulis-aarch64-apple-darwin.tar.gz"
      sha256 "26988f9d12494abfb259c7d5eb5441190bca8216940bc87297ce856b1625f7db"
    end
    on_intel do
      url "https://github.com/barisdemirhan/kulis-releases/releases/download/v0.1.0-alpha.1/kulis-x86_64-apple-darwin.tar.gz"
      sha256 "df5a0312c1bb50e5fcafe7bb0e6cafcb8960359d8b9dd7becb439c0d9a5a6008"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/barisdemirhan/kulis-releases/releases/download/v0.1.0-alpha.1/kulis-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ea69df8c46d4b3be73df4ef25c829e033ad6306de6252c59c1fec4f3223c3668"
    end
    on_intel do
      url "https://github.com/barisdemirhan/kulis-releases/releases/download/v0.1.0-alpha.1/kulis-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bb491fd4fb7c7ce648445632484aa63b282535635006bace2d391fd6e4adff21"
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
