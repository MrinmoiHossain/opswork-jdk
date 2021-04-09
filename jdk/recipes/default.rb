# Download Java tar file
remote_file "/tmp/#{node['java']['install']['file']}" do
    source "#{node['java']['install']['repo']}/#{node['java']['install']['file']}"
    owner 'root'
    group 'root'
end

bash 'make_dir' do
    code <<-EOH
        mkdir -p /usr/lib/jvm
    EOH
end

# Extract the file
tar_extract "/tmp/#{node['java']['install']['file']}" do
    action :extract_local
    target_dir "/usr/lib/jvm"
end