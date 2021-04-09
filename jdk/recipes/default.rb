package 'wget'

bash 'make_dir' do
    code <<-EOH
        mkdir -p "MrinmoiHossain"
    EOH
end

bash 'install_java' do
    code <<-EOH
        wget "#{node['java']['install']['repo']}/#{node['java']['install']['file']}" -O "/tmp/#{node['java']['install']['file']}"
	sudo tar xfvz "/tmp/#{node['java']['install']['file']}" --directory /usr/lib/jvm
    EOH
end