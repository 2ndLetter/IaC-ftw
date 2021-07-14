#!/bin/bash -xe
#exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

#sudo yum update -y

echo "*/1 * * * * /opt/scripts/consume.sh" > /tmp/consume

sudo mv /tmp/consume /etc/cron.d/consume

sudo chown root: /etc/cron.d/consume

sudo chmod 0644 /etc/cron.d/consume
