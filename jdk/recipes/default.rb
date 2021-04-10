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
    EOH
end

# Extract the file
tar_extract "/tmp/git-1.8.4.3.tar.gz" do
    target_dir "/usr/lib/jvm"
    user 'root'
    group 'root'
end