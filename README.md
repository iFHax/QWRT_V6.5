# QWRT Theme OpenWrt 21.02

## DESIGN
<pre><code>
sed -i 's/移动数据/Modem/g' /usr/lib/lua/luci/controller/quectel.lua
rm -r /www/luci-static/design
opkg update
opkg install unrar
wget https://raw.githubusercontent.com/iFHax/QWRT-THEME/main/luci-static-design.tar.gz -O /tmp/luci-static-design.tar.gz
unrar x /tmp/luci-static-design.tar.gz -d /www/luci-static/
rm -f /tmp/luci-static-design.tar.gz
/etc/init.d/uhttpd restart
</code></pre>


