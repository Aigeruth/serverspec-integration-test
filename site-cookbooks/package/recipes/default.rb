case node["platform"]
when "redhat", "centos", "fedora"
  package "bind-utils" do
    action :install
  end
end

package "ethtool" do
  action :install
end

package "gawk" do
  action :install
end

package "postfix" do
  action :install
end

case node["platform"]
when "redhat", "centos", "fedora"
  php_package = "php"
when "ubuntu"
  php_package = "php5"
end

package php_package do
  action :install
end

package "memcached" do
  action :install
end

service "memcached" do
  action [ :enable, :start ]
end

package "dnsmasq" do
  action :install
end

service "dnsmasq" do
  action [ :enable, :start ]
end
