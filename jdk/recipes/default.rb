package 'wget'

bash 'make_dir' do
    code <<-EOH
        mkdir -p "MrinmoiHossain"
    EOH
end

bash 'install_java' do
    code <<-EOH
        wget https://mirrors.edge.kernel.org/pub/software/scm/git/git-1.8.4.3.tar.gz -O /tmp/git-1.8.4.3.tar.gz
    EOH
end