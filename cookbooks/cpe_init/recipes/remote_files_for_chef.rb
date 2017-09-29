cpe_remote_file 'chef' do
    file_name 'chefctl.rb'
    checksum '625e1ce3acb2c5ad6417c8e661a37a327f44a2c2772dc8e4124dc8aba1d51b8c'
    path '/usr/local/bin/chefctl.rb'
    mode '0755'
end
cpe_remote_file 'chef' do
    file_name 'chefctl_config.rb'
    checksum 'ce53928e9f2d85ecd851113392bb2f49119a16853f5e755b8b67ede41c7dd813'
    path '/etc/chefctl_config.rb'
    mode '0755'
end