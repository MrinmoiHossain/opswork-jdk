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
execute "extract_tar" do
    command "sudo tar xfvz /tmp/#{node['java']['install']['file']}"
    cwd "/usr/lib/jvm"
    not_if { File.exists?("/usr/lib/jvm") }
end
