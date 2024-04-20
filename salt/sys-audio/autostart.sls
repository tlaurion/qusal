{#
SPDX-FileCopyrightText: 2024 Benjamin Grande M. S. <ben.grande.b@gmail.com>

SPDX-License-Identifier: AGPL-3.0-or-later
#}

"{{ slsdotpath }}-autostart-audiovm":
  qvm.vm:
    - name: disp-{{ slsdotpath }}
    - prefs:
      - autostart: True