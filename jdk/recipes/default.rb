package 'wget'

bash 'install_java' do
    code <<-EOH
        wget "#{node['java']['install']['repo']}/#{node['java']['install']['file']}" -O "/tmp/#{node['java']['install']['file']}"
	mkdir -p /usr/lib/jvm
	sudo tar xfvz "/tmp/#{node['java']['install']['file']}" --directory /usr/lib/jvm
        export PATH=$PATH:/usr/lib/jvm/jdk-11.0.1/bin
        export JAVA_HOME=/usr/lib/jvm/jdk-11.0.1/
        export J2SDKDIR=/usr/lib/jvm/jdk-11.0.1/
    EOH
end