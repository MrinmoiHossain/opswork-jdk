# Download Java tar file
remote_file "/tmp/#{node['java']['install']['file']}" do
    source "#{node['java']['install']['repo']}/#{node['java']['install']['file']}"
    owner 'root'
    group 'root'
end

# Make Directory
bash 'make_dir' do
    code <<-EOH
	mkdir -p /usr/lib/jvm
    EOH
end

# Extract the file
tar_extract "/tmp/#{node['java']['install']['file']}" do
    target_dir "/usr/lib/jvm"
    tar_flags  [ '-P', '--strip-components 1' ]
    user 'root'
    group 'root'
end