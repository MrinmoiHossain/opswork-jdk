bash 'install-java' do
    code <<-EOH
    wget "{node['java']['install']['repo']}/{node['java']['install']['file']}" -O "/tmp/{node['java']['install']['file']}"
    sudo tar xfvz "/tmp/{node['java']['install']['file']}" --directory /usr/lib/jvm
    unlink java
    ln -s usr/lib/jvm/jdk-11 java
    EOH
end