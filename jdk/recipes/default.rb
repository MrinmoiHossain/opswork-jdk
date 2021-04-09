bash 'install-java' do
    code <<-EOH
    echo "####################### Mrinmoi ########################\n"
    echo "{node['java']['install']['repo']}"
    wget "{node['java']['install']['repo']}/{node['java']['install']['file']}" -O "/tmp/{node['java']['install']['file']}"
    pwd
    
    #sudo tar xfvz "/tmp/{node['java']['install']['file']}" --directory /usr/lib/jvm
    #unlink java
    #ln -s /usr/lib/jvm/jdk-11 java
    EOH
end