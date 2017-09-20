#!/bin/bash
#Create validators group
#knife group create rossellimac-validator

# Add YOURORG-validator (it is made when you create an org) to newly created validator group
#knife group add client rossellimac-validator rossellimac-validator

# Add clients permission for newly created validator group
#knife acl add group rossellimac-validator containers clients read
#knife acl add group rossellimac-validator containers clients create
knife acl add group rossellimac-validator containers clients update
knife acl add group rossellimac-validator containers clients grant
knife acl add group rossellimac-validator containers clients delete

# Add nodes permission for newly created validator group
knife acl add group rossellimac-validator containers nodes read
knife acl add group rossellimac-validator containers nodes create
knife acl add group rossellimac-validator containers nodes update
knife acl add group rossellimac-validator containers nodes grant
knife acl add group rossellimac-validator containers nodes delete