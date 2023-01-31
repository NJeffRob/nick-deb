# nick-deb
PLEASE READ: This is still in testing and isn't done yet. I'm not 100% sure that this works on a VM yet, let alone on an actual computer. Use at your own risk (though if you're into this stuff in the first place, you should make your own).

My version of debian for the install that I want.

Note that you will need a stable install of debian without a desktop environment but with system utilities installed.

In the case that initramfs-tools is broken, simply uninstall it and re-install it.

To Install:
* sudo apt install git -y
* git clone https://github.com/NJeffRob/nick-deb
* cd nick-deb
* chmod +x install.sh
* sudo ./install.sh
