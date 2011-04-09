# We're really non-interactive so don't pester us with questions
DEBIAN_FRONTEND=noninteractive

# Add chef apt repository
echo "deb http://apt.opscode.com/ `lsb_release -cs` main" \
  >/etc/apt/sources.list.d/opscode.list
wget -q -O- http://apt.opscode.com/packages@opscode.com.gpg.key | apt-key add -

# Update the box
apt-get -y update
apt-get -y install linux-headers-$(uname -r) build-essential 
apt-get -y install zlib1g-dev libssl-dev libreadline5-dev
apt-get -y install curl unzip
apt-get clean

# Set up sudo
cp /etc/sudoers /etc/sudoers.orig
sed -i -e 's/%sudo ALL=(ALL) ALL/%sudo ALL=NOPASSWD:ALL/g' /etc/sudoers

# Install chef
apt-get -y install chef

# Install vagrant keys
mkdir -p /home/vagrant/.ssh
chmod 700 /home/vagrant/.ssh
cd /home/vagrant/.ssh
curl -o /home/vagrant/.ssh/authorized_keys \
  'http://github.com/mitchellh/vagrant/raw/master/keys/vagrant.pub'
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh

# Tweak sshd to prevent DNS resolution (speed up logins)
echo 'UseDNS no' >> /etc/ssh/sshd_config

# Customize the message of the day
echo 'Welcome to your Vagrant-built virtual machine.' > /var/run/motd

# The netboot installs the VirtualBox support (old) so we have to remove it
apt-get -y remove virtualbox-ose-guest-dkms
apt-get -y remove virtualbox-ose-guest-utils

# Install the VirtualBox guest additions
VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
curl -Lo /tmp/VBoxGuestAdditions_$VBOX_VERSION.iso \
  "http://download.virtualbox.org/virtualbox/$VBOX_VERSION/VBoxGuestAdditions_$VBOX_VERSION.iso"
mount -o loop /tmp/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
yes|sh /mnt/VBoxLinuxAdditions.run
umount /mnt
rm /tmp/VBoxGuestAdditions_$VBOX_VERSION.iso 

# Clean up
apt-get -y remove linux-headers-$(uname -r) build-essential
apt-get -y autoremove

exit
