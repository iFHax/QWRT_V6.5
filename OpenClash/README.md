## Sve
<pre><code>
  wget -O /etc/openclash_autostart.sh https://raw.githubusercontent.com/iFHax/QWRT-THEME/main/OpenClash/openclash_autostart.sh && chmod +x /etc/openclash_autostart.sh
</code></pre>

## Set Cronjob

<pre><code>*/5 * * * * pgrep clash > /dev/null || /etc/openclash_autostart.sh &</code></pre>
