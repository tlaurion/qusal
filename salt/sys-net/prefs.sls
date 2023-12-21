{#
SPDX-FileCopyrightText: 2023 Benjamin Grande M. S. <ben.grande.b@gmail.com>

SPDX-License-Identifier: AGPL-3.0-or-later
#}

include:
  - .create

{% set default_netvm = salt['cmd.shell']('qubes-prefs default_netvm') -%}
"{{ slsdotpath }}-set-{{ default_netvm }}-netvm-to-{{ slsdotpath }}":
  qvm.vm:
    - require:
      - qvm: {{ slsdotpath }}
    - name: {{ default_netvm }}
    - prefs:
      - netvm: {{ slsdotpath }}

{% from 'utils/macros/policy.sls' import policy_set with context -%}
{{ policy_set(sls_path, '80') }}
