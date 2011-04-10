# **postinstall.sh** is a script executed after Ubuntu has been installed and
# restarted. There is no user interaction so all commands must be able to run
# in a non-interactive mode.
#
# If any package install time questions need to be set, you can use
# `preeseed.cfg` to populate the settings.


### Additional Ubuntu Package Repositories

# There is an Opscode *apt* repository with current builds of chef that
# only depend on the package installed Ruby. At present, I cannot find
# a complimentary repository for updated puppet packages and as a result
# an older "safe" package will be installed from the main Ubuntu *apt*
# repository.

# Add the Opscode *apt* repository by creating a `.list` file and adding
# the repository key
echo "deb http://apt.opscode.com/ `lsb_release -cs` main" \
  >/etc/apt/sources.list.d/opscode.list
wget -q -O- http://apt.opscode.com/packages@opscode.com.gpg.key | apt-key add -


# Now update the system with `update` and `upgrade`. The `update` will
# also fetch the package manifest from any additionally added repositories.
# The `upgrade` will update any out of date packages but will almost certainly
# do nothing as we've installed from the netboot installer and all packages
# should be up to date.
apt-get -y update
apt-get -y upgrade

### Customize Sudoers

# The main user (`vagrant` in our case) needs to have **password-less** sudo
# access as described in the Vagrant base box
# [documentation](http://vagrantup.com/docs/base_boxes.html#setup_permissions).
# This user belongs to the `admin` group, so we'll change that line.
sed -i -e 's/%sudo ALL=(ALL) ALL/%sudo ALL=NOPASSWD:ALL/g' /etc/sudoers

### Chef and Puppet Packages

# The Vagrant base box
# [documentation](http://vagrantup.com/docs/base_boxes.html#boot_and_setup_basic_software)
# specifies that both the Puppet and Chef gems should be installed to qualify
# as a complete Vagrant base box.
export DEBIAN_FRONTEND=noninteractive
apt-get -y install chef
apt-get -y install puppet

### Vagrant SSH Keys

# Since Vagrant only supports key-based authentication for SSH, we must
# set up the vagrant user to use key-based authentication. We can get the
# public key used by the Vagrant gem directly from its Github repository.
mkdir -p /home/vagrant/.ssh
chmod 700 /home/vagrant/.ssh
(cd /home/vagrant/.ssh &&
  wget --no-check-certificate \
    'https://github.com/mitchellh/vagrant/raw/master/keys/vagrant.pub' \
    -O /home/vagrant/.ssh/authorized_keys)
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh

### VirtualBox Guest Additions

# The netboot installs the VirtualBox support (old) so we have to remove it
apt-get -y remove virtualbox-ose-guest-dkms
apt-get -y remove virtualbox-ose-guest-utils

# The Guest Additions installer will require the use of a compiler, so we'll
# install it for the moment
apt-get -y install linux-headers-$(uname -r) build-essential

# Now download the current VirtualBox guest additions from the VirtualBox
# website, mount, and install it
VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
(cd /tmp &&
  wget http://download.virtualbox.org/virtualbox/$VBOX_VERSION/VBoxGuestAdditions_$VBOX_VERSION.iso)
mount -o loop /tmp/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
yes|sh /mnt/VBoxLinuxAdditions.run
umount /mnt

# Cleanup the downloaded ISO
rm -f /tmp/VBoxGuestAdditions_$VBOX_VERSION.iso

# Remove the build tools again to keep things pristine
apt-get -y remove linux-headers-$(uname -r) build-essential

### Misc. Tweaks

# Tweak sshd to prevent DNS resolution (speed up logins)
echo 'UseDNS no' >> /etc/ssh/sshd_config

# Customize the message of the day
echo 'Welcome to your Vagrant-built virtual machine.' > /var/run/motd

### Clean up

apt-get -y autoremove
apt-get -y clean

exit

# And we're done.
