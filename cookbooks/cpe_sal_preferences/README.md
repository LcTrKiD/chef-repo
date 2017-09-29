cpe_sal_preferences Cookbook
========================
Install a profile to manage sal preferences settings.


Attributes
----------
* node['cpe_sal_preferences']
* node['cpe_sal_preferences']['BasicAuth']
* node['cpe_sal_preferences']['ServerURL']
* node['cpe_sal_preferences']['SkipFacts']
* node['cpe_sal_preferences']['key']
* node['cpe_sal_preferences']['GetGrains']
* node['cpe_sal_preferences']['GetOhai']
* node['cpe_sal_preferences']['SyncScripts']


Usage
-----
The profile will manage the `com.github.salopensource.sal` preference domain.

The profile's organization key defaults to `Facebook` unless `node['organization']` is
configured in your company's custom init recipe. The profile will also use
whichever prefix is set in node['cpe_profiles']['prefix'], which defaults to `com.facebook.chef`

The profile delivers a payload for the above keys in `node['cpe_sal_preferences']`.  The seven provided have a sane default, which can be overridden in another recipe if desired.

For example, you could tweak the above values

    node.default['cpe_sal_preferences']['ServerURL'] = 'http://sal"
    node.default['cpe_sal_preferences']['key'] = 'veryveryverylongtext'