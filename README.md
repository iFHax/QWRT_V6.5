# QWRT Theme OpenWrt 21.02
<pre><code>
opkg update
opkg install unrar
wget https://raw.githubusercontent.com/iFHax/QWRT-THEME/main/design.rar -O /tmp/design.rar
unrar x /tmp/design.rar -d /www/luci-static/
rm -f /tmp/design.rar
/etc/init.d/uhttpd restart
</code></pre>

 

