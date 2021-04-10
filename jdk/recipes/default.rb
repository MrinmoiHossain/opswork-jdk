# Download Java tar file
remote_file "/tmp/#{node['java']['install']['file']}" do
    source "#{node['java']['install']['repo']}/#{node['java']['install']['file']}"
    user 'root'
    group 'root'
end

# Make Directory
bash 'make_dir' do
    code <<-EOH
	mkdir -p /usr/lib/jvm
        sudo tar xfvz "/tmp/#{node['java']['install']['file']}" --directory /usr/lib/jvm
    EOH
end

# Extract the file


directory '/etc/profile.d' do
    mode '0755'
end

template '/etc/profile.d/jdk.sh' do
    source 'jdk.sh.erb'
    mode '0755'
end


