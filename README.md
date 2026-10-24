# lejmr/tap

```sh
brew tap lejmr/tap
```

| Formula | |
| --- | --- |
| [herdr-lid-awake](https://github.com/lejmr/herdr-lid-awake) | Keep the Mac running with the lid closed while the Herdr UI cup is on |

## For maintainers

`url` and `sha256` of a formula are rewritten by the release workflow of its own repository (`TAP_TOKEN` pushes the commit here). Until the first release has done that, `sha256` of `herdr-lid-awake` is 64 zeros and CI fails on `brew install` with a checksum mismatch. That is on purpose: a green tap with a placeholder would be a lie. Do not edit the checksum by hand.
