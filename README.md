# homebrew-kulis

Homebrew tap for [kulis](https://github.com/barisdemirhan/kulis-releases).

> **Invite-only alpha.** kulis is still under development and is meant for invited testers only.
> Installing it gives you nothing by itself: joining a room needs an invite from its host, and only
> approved keys can create rooms. If nobody has invited you, please wait for a public release.

```sh
brew tap barisdemirhan/kulis
brew trust --formula barisdemirhan/kulis/kulis   # Homebrew 7+ refuses untrusted third-party formulae
brew install barisdemirhan/kulis/kulis
kulis config set relay <relay-url-from-your-host>
kulis install claude-code --yes   # or: kulis install codex --yes
kulis doctor
```

The formula installs the same signed release binaries the kulis installer verifies. Each release's
`sha256.sum` is signed with the key `SHA256:FHeUV7MULX96k1h5pXKgeeRxiRgt2k5RBMGMBeUdsZo`; the formula
pins the per-archive sha256 values from that signed file.

There are no bottles: Homebrew treats the formula as a source install and checks your developer
tools first, even though it only copies a prebuilt binary. If it stops with "Your Xcode … is too
outdated", update Xcode (or remove it and keep the Command Line Tools), or use the signed installer
your host sent you instead.

License: MIT OR Apache-2.0.
