# QWRT Theme OpenWrt 21.02 for QWRT BY Abi Darwish Arcadyan Telstra AW1000 5G Modem 

## AUTO SET
<pre><code>
  wget -q -O /tmp/auto-set.sh https://raw.githubusercontent.com/iFHax/QWRT-THEME/main/auto-set.sh && chmod +x /tmp/auto-set.sh && /tmp/auto-set.sh
</code></pre>

## FAVICON
<pre><code>
rm -f /www/luci-static/design/images/apple-touch-icon.png
wget -q -O /www/luci-static/design/images/apple-touch-icon.png https://raw.githubusercontent.com/iFHax/QWRT-THEME/main/cat.png
</code></pre>

## DESIGN-ORIGIN
<pre><code>
sed -i 's/移动数据/Modem/g' /usr/lib/lua/luci/controller/quectel.lua
rm -f /www/luci-static/design/css/style.css
wget -q -O https://raw.githubusercontent.com/iFHax/QWRT-THEME/main/design-orygin-style.css.bak -O /tmp/design-orygin-style.css.bak
mv /tmp/design-orygin-style.css.bak /www/luci-static/design/css/style.css
/etc/init.d/uhttpd restart
</code></pre>

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


