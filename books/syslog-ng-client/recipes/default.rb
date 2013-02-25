package "syslog-ng"

service "syslog-ng" do
  supports status: true, restart: true
  action [:enable, :start]
  #enable => When OS boots
  #start => When Chef runs, start syslog-ng if its not running
end

template "/etc/syslog-ng/syslog-ng.conf" do
  notifies :reload, "service[syslog-ng]"
  variables staging_log_key: "^rails.*staging$", production_log_key: "^rails.*production$"
end
