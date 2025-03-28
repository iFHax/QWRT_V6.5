## CECKER
<pre><code>
  echo -e "echo \"\$(date '+%Y-%m-%d %H:%M:%S') - Checked\" >> /root/rc_test.log\n/etc/openclash_autostart.sh &" >> /etc/rc.local
  wget -O /etc/openclash_autostart.sh https://raw.githubusercontent.com/iFHax/QWRT-THEME/main/OpenClash/openclash_autostart.sh && chmod +x /etc/openclash_autostart.sh
</code></pre>

## SET

<pre><code>*/5 * * * * pgrep clash > /dev/null || /etc/openclash_autostart.sh &</code></pre>
