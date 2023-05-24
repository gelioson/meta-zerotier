# meta-zerotier
Port Zerotier to Yocto

## Dependencies

 - URI: [https://github.com/zerotier/ZeroTierOne](https://github.com/zerotier/ZeroTierOne)

## How to use

 1. Register in [zerotier.com](https://www.zerotier.com), create a network, remeber networkID
 2. Add `meta-zerotier` layer to `bblayers.conf`
 3. Add `zerotier` image to `IMAGE_INSTALL`
 4. Add `ZEROTIER_NETWORK_ID = "YOUR_ZEROTIER_NETWORK_ID"` to `local.conf`
 5. Build the image, install, run
 6. Approve you new device in ZeroTier Central
 7. You can control Zerotier by 
 ```
 	zerotier-control start|stop|status
 ```
 7. Enjoy!
