# QWRT Theme OpenWrt 21.02

## DESIGN
<pre><code>
rm -r /www/luci-static/design
opkg update
opkg install unrar
wget https://raw.githubusercontent.com/iFHax/QWRT-THEME/main/design.rar -O /tmp/design.rar
unrar x /tmp/design.rar -d /www/luci-static/
rm -f /tmp/design.rar
/etc/init.d/uhttpd restart
</code></pre>

 ## DESIGN-G
<pre><code>
rm -r /www/luci-static/design
opkg update
opkg install unrar
wget https://raw.githubusercontent.com/iFHax/QWRT-THEME/main/design-g.rar -O /tmp/design-g.rar
unrar x /tmp/design-g.rar -d /www/luci-static/
rm -f /tmp/design-g.rar
/etc/init.d/uhttpd restart
</code></pre>

