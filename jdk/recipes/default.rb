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

if node['java']['set_etc_environment'] # ~FC023 -- Fails unit test to use guard
    ruby_block 'Set JAVA_HOME in /etc/environment' do
        block do
            file = Chef::Util::FileEdit.new('/etc/environment')
            file.insert_line_if_no_match(/^JAVA_HOME=/, "JAVA_HOME=#{node['java']['java_home']}")
            file.search_file_replace_line(/^JAVA_HOME=/, "JAVA_HOME=#{node['java']['java_home']}")
            file.write_file
        end
    end
end
