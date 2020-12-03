rpm -Uvh https://repo.zabbix.com/zabbix/4.4/rhel/6/x86_64/zabbix-release-4.4-1.el6.noarch.rpm
yum clean all
yum install zabbix-agent -y
mv /etc/zabbix/zabbix_agentd.conf /etc/zabbix/zabbix_agentd.conf.org
echo "PidFile=/var/run/zabbix/zabbix_agentd.pid" > /etc/zabbix/zabbix_agentd.conf
echo "LogFile=/var/log/zabbix/zabbix_agentd.log" >> /etc/zabbix/zabbix_agentd.conf
echo "LogFileSize=0" >> /etc/zabbix/zabbix_agentd.conf
echo "Server=127.0.0.1,49.12.66.34" >> /etc/zabbix/zabbix_agentd.conf
echo "Hostname=$HOSTNAME" >> /etc/zabbix/zabbix_agentd.conf
echo "ServerActive=127.0.0.1" >> /etc/zabbix/zabbix_agentd.conf
echo "Hostname=$HOSTNAME" >> /etc/zabbix/zabbix_agentd.conf
echo "Include=/etc/zabbix/zabbix_agentd.d/*.conf" >> /etc/zabbix/zabbix_agentd.conf
sleep 3
service zabbix-agent restart
sleep 3
chkconfig --level 35 zabbix-agent on
sleep 3
service zabbix-agent restart