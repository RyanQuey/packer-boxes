# Packer Build - Ubuntu 18.04 minimal Vagrant Box

See [packer docs](https://www.packer.io/docs/builders/virtualbox-iso) for help

- Install scripts are in no particular order, though initialize.sh should be first in those scripts and I think maybe setup-vagrant should be at the end
- Note that none of them count against the timeout, since they run after ssh is established
- It seems that using vrdp before the boot scripts run make it more likely that we accidentally enter the gui configuration even though we do the whole `"<esc><wait><wait>"` stuff. So just wait until the STDOUT reads:
```
==> virtualbox-iso: Waiting 10s for boot...
==> virtualbox-iso: Typing the boot command...
==> virtualbox-iso: Using ssh communicator to connect: 127.0.0.1
```

before trying vrdp


Can start by running the `build-with-debug.ps1` file in powershell
**Current Ubuntu Version Used**: 18.04.4

See the [project README.md](../README.md) for usage instructions.
