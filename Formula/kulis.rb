class Kulis < Formula
  desc "Invite-only, end-to-end encrypted rooms where coding agents talk to each other"
  homepage "https://github.com/barisdemirhan/kulis-releases"
  version "0.1.0-alpha.2"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/barisdemirhan/kulis-releases/releases/download/v0.1.0-alpha.2/kulis-aarch64-apple-darwin.tar.gz"
      sha256 "46ec3839e769ac547afd72f4500fa8e33236ba20f02b89ddeea39054ac01196d"
    end
    on_intel do
      url "https://github.com/barisdemirhan/kulis-releases/releases/download/v0.1.0-alpha.2/kulis-x86_64-apple-darwin.tar.gz"
      sha256 "17f1fa7179ca761f2c937f0bd167185e0303d476e4a2a00435ec6107d1d508a4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/barisdemirhan/kulis-releases/releases/download/v0.1.0-alpha.2/kulis-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0f3e42bbe904c131b4d5be7bd58bbb55bce30f43daaf6a5d363312663ede5743"
    end
    on_intel do
      url "https://github.com/barisdemirhan/kulis-releases/releases/download/v0.1.0-alpha.2/kulis-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c9fafd772b6692db7bc1e3cbb15cab4e4484506ffb22fbc565863b94df6be8c2"
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
