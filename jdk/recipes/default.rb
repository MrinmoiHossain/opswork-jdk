# Download Java tar file
remote_file "/tmp/#{node['java']['install']['file']}" do
    source "#{node['java']['install']['repo']}/#{node['java']['install']['file']}"
    user 'root'
    group 'root'
end

# Make Directory 
directory "#{node['java']['jvm_dir']}" do
    recursive true
    action :delete
    only_if { ::Dir.exist?("#{node['java']['jvm_dir']}") || !::File.symlink?("#{node['java']['jvm_dir']}") }
end

directory "#{node['java']['jvm_dir']}" do
    owner 'root'
    group 'root'
    action :create
end

# Extract the file
tar_extract "/tmp/#{node['java']['install']['file']}" do
    action :extract_local
    target_dir "#{node['java']['jvm_dir']}"
    creates "#{node['java']['jvm_dir']}/test_file"
    user 'root'
    group 'root'
end

# Set Java Home
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
            file.insert_line_if_no_match(/^PATH=/, "PATH=\$PATH\:#{node['java']['java_home']}/bin")
            file.insert_line_if_no_match(/^JAVA_HOME=/, "JAVA_HOME=#{node['java']['java_home']}")
            file.search_file_replace_line(/^JAVA_HOME=/, "JAVA_HOME=#{node['java']['java_home']}")
            file.write_file
        end
    end
end

# Java Symlink
link "/usr/lib/jvm/jdk-11.0.1" do
    to "java"
    not_if { "java" == '/usr/lib/jvm/jdk-11.0.1' }
    owner 'root'
    group 'root'
end