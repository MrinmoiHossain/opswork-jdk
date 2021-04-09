# Download Java tar file
remote_file "/tmp/#{node['java']['install']['file']}" do
    source "#{node['java']['install']['repo']}/#{node['java']['install']['file']}"
    owner 'root'
    group 'root'
end

# Extract the file
archive_file '/tmp/#{node['java']['install']['file']}' do
    path '/tmp/#{node['java']['install']['file']}'
    destination '/usr/lib/jvm'
    owner 'root'
    group 'root'
end