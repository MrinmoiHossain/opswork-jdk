# Download Java tar file
remote_file "/tmp/#{node['java']['install']['file']}" do
    source "#{node['java']['install']['repo']}/#{node['java']['install']['file']}"
    owner 'root'
    group 'root'
end


# Extract the file
excute "extract_tar" do
    command "sudo tar xfvz /tmp/#{node['java']['install']['file']} --directory /usr/lib/jvm"
    action :run
    not_if { Dir.exist?("/usr/lib/jvm") }
end