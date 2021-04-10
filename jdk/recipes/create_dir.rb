directory "/etc/Mrinmoi" do
    action :delete
    only_if { ::Dir.exist?("/etc/Mrinmoi") || !::File.symlink?("/etc/Mrinmoi") }
end

