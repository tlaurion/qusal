# sys-wireguard

Wireguard VPN in Qubes OS.

## Table of Contents

* [Description](#description)
* [Installation](#installation)
* [Usage](#usage)
* [Credits](#credits)

## Description

Setup a Wireguard VPN qube named "sys-wireguard" to provide network access to
other qubes through the VPN with fail closed mechanism.

## Installation

- Top:
```sh
qubesctl top.enable sys-wireguard
qubesctl --targets=tpl-sys-wireguard,sys-wireguard state.apply
qubesctl top.disable sys-wireguard
```

- State:
<!-- pkg:begin:post-install -->
```sh
qubesctl state.apply sys-wireguard.create
qubesctl --skip-dom0 --targets=tpl-sys-wireguard state.apply sys-wireguard.install
qubesctl --skip-dom0 --targets=sys-wireguard state.apply sys-wireguard.configure
```
<!-- pkg:end:post-install -->

To add the VPN configuration and configure the qubes firewall:
```sh
/srv/salt/qusal/sys-wireguard/files/admin/setup-sys-wireguard.sh
```

## Usage

Use the VPN qube `sys-wireguard` to enforce incoming and outgoing connections
from clients connected to the VPN with a fail safe mechanism.

## Credits

- [Unman](https://github.com/unman/shaker/tree/main/mullvad)