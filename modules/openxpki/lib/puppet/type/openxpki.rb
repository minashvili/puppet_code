# frozen_string_literal: true

require 'puppet/resource_api'

Puppet::ResourceApi.register_type(
  name: 'openxpki',
  docs: <<-EOS,
@summary a openxpki type
@example
openxpki { 'openxpki':
  ensure => 'present',
}

This type provides Puppet. with the capabilities to manage ...

If your type uses autorequires, please document as shown below, else delete
these lines.
**Autorequires**:
* `Package[foo]`
EOS
  features: [],
  attributes: {
    ensure: {
      type: 'Enum[present, absent]',
      desc: 'Whether this resource should be present or absent on the target system.',
      default: 'present',
    },
    name: {
      type: 'String',
      desc: 'The name of the resource you want to manage.',
      behaviour: :namevar,
    },
    path: {
      type: 'String',
      desc: 'The path to the OpenXPKI configuration file.',
    },
    crt_common_name: {
      type: 'String',
      desc: 'The common name of your crt.',
    },
    crt_manual_alt_names: {
      type: 'Array[String]',
      desc: 'The alt name of your crt.',
    },
  },
)
