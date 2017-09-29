#
# Cookbook Name:: cpe_sal_preferences
# Resource:: cpe_sal_preferences
#
# vim: syntax=ruby:expandtab:shiftwidth=2:softtabstop=2:tabstop=2
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree. An additional grant
# of patent rights can be found in the PATENTS file in the same directory.
#

resource_name :cpe_sal_preferences
default_action :config

action :config do
  sal_prefs = node['cpe_sal_preferences'].reject { |_k, v| v.nil? }
  return if sal_prefs.empty?
  prefix = node['cpe_profiles']['prefix']
  organization = node['organization'] ? node['organization'] : 'Facebook'
  node.default['cpe_profiles']["#{prefix}.sal_preferences"] = {
    'PayloadIdentifier' => "#{prefix}.sal_preferences",
    'PayloadRemovalDisallowed' => true,
    'PayloadScope' => 'System',
    'PayloadType' => 'Configuration',
    'PayloadUUID' => '1cf145e1-cbaf-4f1c-82ca-80e10a295deb',
    'PayloadOrganization' => organization,
    'PayloadVersion' => 1,
    'PayloadDisplayName' => 'Sal Preferences',
    'PayloadContent' => [
      {
        'PayloadType' => 'com.apple.ManagedClient.preferences',
        'PayloadVersion' => 1,
        'PayloadIdentifier' => "#{prefix}.sal_preferences",
        'PayloadUUID' => '6ce7ec48-0296-4a8b-bf6d-30a93f9c3bf5',
        'PayloadEnabled' => true,
        'PayloadDisplayName' => 'Sal Preferences',
        'PayloadContent' => {
          'com.github.salopensource.sal' => {
            'Forced' => [
              {
                'mcx_preference_settings' => sal_prefs,
              },
            ],
          },
        },
      },
    ],
  }
end
