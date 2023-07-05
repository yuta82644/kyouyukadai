server '52.192.189.85', user: 'app', roles: %w{app db web}


set :ssh_options, keys: 'Users/yuta/.ssh/id_rs'