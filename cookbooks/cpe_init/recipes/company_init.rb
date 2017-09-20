#
# Cookbook Name:: cpe_init
# Recipe:: company_init
#
# vim: syntax=ruby:expandtab:shiftwidth=2:softtabstop=2:tabstop=2
#
# Copyright (c) 2016-present, Facebook, Inc.
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree. An additional grant
# of patent rights can be found in the PATENTS file in the same directory.
#

# HERE: This is where you would set attributes that are consumed by the API
# cookbooks.
# Be sure to replace all instances of MYCOMPANY with your actual company name
node.default['organization'] = 'Rossellimac'
prefix = "com.#{node['organization']}.chef"
node.default['cpe_launchd']['prefix'] = prefix
node.default['cpe_profiles']['prefix'] = prefix

# Install munki
node.default['cpe_munki']['install'] = true
node.default['cpe_munki']['munki_version_to_install']['admin'] = {
  'version' => '3.0.3.3352',
  'url' => 'https://munki-server.s3.amazonaws.com/files/munkitools_admin-3.0.3.3352.pkg',
  'checksum' =>
    'ac9c54411c811c858bf5702806e7394964adfe00a6e015e528dfd0c5dfb8086f',
}
node.default['cpe_munki']['munki_version_to_install']['app'] = {
  'version' => '4.6.3348',
  'url' => 'https://munki-server.s3.amazonaws.com/files/munkitools_app-4.6.3348.pkg',
  'checksum' =>
  'e69d05b177956100fd248c822ba089eb3265d35fc5aa74e7e1e2c42e1a92fa62',
}
node.default['cpe_munki']['munki_version_to_install']['app_usage'] = {
  'version' => '3.0.3.3352',
  'url' => 'https://munki-server.s3.amazonaws.com/files/munkitools_app_usage-3.0.3.3352.pkg',
  'checksum' =>
  '1cda285adcf0e49923a5b783d8817664e8da7e5d70d074e2a7210709cbc6ebc8',
}
node.default['cpe_munki']['munki_version_to_install']['core'] = {
  'version' => '3.0.3.3352',
  'url' => 'https://munki-server.s3.amazonaws.com/files/munkitools_core-3.0.3.3352.pkg',
  'checksum' =>
  'c44284924bb3261bb6f23430cce22fbd99221083820e21099c870ac2c96242ba',
}
node.default['cpe_munki']['munki_version_to_install']['launchd'] = {
  'version' => '3.0.3265',
  'url' => 'https://munki-server.s3.amazonaws.com/files/munkitools_launchd-3.0.3265.pkg',
  'checksum' =>
  '170e09d3c91d9bb54895f73bb026a3fbc2d895c7045fd11873b985db73ee7d8a',
}
# Configure munki
node.default['cpe_munki']['configure'] = true
# Override default munki settings
node.default['cpe_munki']['preferences']['SoftwareRepoURL'] =
  'https://munki-server.macadmin.ninja/repo'
node.default['cpe_munki']['preferences']['InstallAppleSoftwareUpdates'] = true
node.default['cpe_munki']['preferences']['AdditionalHttpHeaders'] = [
  'Authorization: Basic c3F1aXJyZWw6c2VjcmV0',
]
node.default['cpe_munki']['preferences']['AccessKey'] = 'AKIAIIRZMUOBLKAERTAA'
node.default['cpe_munki']['preferences']['SecretKey'] = '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'
node.default['cpe_munki']['preferences']['Region'] = 'eu-west-1'
node.default['cpe_munki']['preferences']['ClientIdentifier'] = 'master'
#Adding Munki path
node.default['cpe_pathsd'] << '/usr/local/munki'
#Resolve issue with testing munki server
node.default['cpe_hosts']['extra_entries']['192.168.1.24'] = ['munki-server.macadmin.ninja']

# Manage Local Munki Manifest
managed_installs = [
  # Put managed install items here
]
managed_installs.each do |item|
  node.default['cpe_munki']['local']['managed_installs'] << item
end

#Configure Desktop Wallpaper
node.default['cpe_desktop']['override-picture-path'] = '/Library/Desktop Pictures/Snow.jpg'
#Tweaking Pref Pane
node.default['cpe_preferencepanes']['HiddenPreferencePanes'] = [
  'com.apple.preference.displays',
  'com.apple.preference.network',
]
#Safari defaults
node.default['cpe_safari']['HomePage'] = 'http://www.cosentino.com'
node.default['cpe_safari']['NewWindowBehavior'] = 0

#Blocking some apps
node.default['cpe_applicationaccess']['lists']['pathBlackList'] = [
  '/Applications/App Store.app',
  '/Applications/Chess.app',
  '/Applications/Automator.app',
]