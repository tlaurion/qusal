{#
SPDX-FileCopyrightText: 2023 - 2024 Benjamin Grande M. S. <ben.grande.b@gmail.com>

SPDX-License-Identifier: AGPL-3.0-or-later
#}

{% if grains['nodename'] != 'dom0' -%}

include:
  - .install-repo
  - utils.tools.common.update
  - dotfiles.copy-x11
  - sys-audio.install-client

"{{ slsdotpath }}-installed":
  pkg.installed:
    - require:
      - sls: {{ slsdotpath }}.install-repo
      - sls: utils.tools.common.update
    - install_recommends: False
    - skip_suggestions: True
    - pkgs:
      - qubes-core-agent-networking
      - ca-certificates
      - qubes-core-agent-thunar
      - thunar
      - signal-desktop
      - zenity
      - dunst
      - libatk1.0-0
      - libatk-bridge2.0-0
      - libgtk-4-1

{% endif -%}
