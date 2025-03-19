# QWRT Theme
<pre><code>
 opkg update
opkg install unrar
wget https://raw.githubusercontent.com/iFHax/QWRT-THEME/main/greentee.rar -O /tmp/greentee.rar
unrar x /tmp/greentee.rar -d /www/luci-static/
rm -f /tmp/greentee.rar
/etc/init.d/uhttpd restart
</code></pre>

 

