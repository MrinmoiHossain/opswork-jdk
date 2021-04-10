directory "/etc/Mrinmoi" do
    action :delete
    only_if { ::Dir.exist?("/etc/Mrinmoi") || !::File.symlink?("/etc/Mrinmoi") }
end

directory '/etc/Mrinmoi' do
    owner 'root'
    group 'root'
    action :create
end