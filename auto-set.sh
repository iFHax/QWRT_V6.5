#!/bin/sh

change_favicon() {
    echo "Changing favicon..."
    rm -f /www/luci-static/design/images/apple-touch-icon.png
    wget -q -O /www/luci-static/design/images/apple-touch-icon.png https://raw.githubusercontent.com/iFHax/QWRT_V6.5/main/cat.png
    echo "Favicon successfully changed!"
}

fix_original_theme_icon() {
     sed -i 's/移动数据/Modem/g' /usr/lib/lua/luci/controller/quectel.lua
     rm -f /www/luci-static/design/css/style.css
     wget -q -O https://raw.githubusercontent.com/iFHax/QWRT_V6.5/main/design-orygin-style.css.bak -O /tmp/design-orygin-style.css.bak
     mv /tmp/design-orygin-style.css.bak /www/luci-static/design/css/style.css
     /etc/init.d/uhttpd restart
 }
 
translet_modem_add_icon() {
    echo "Translating 'Mobile Data' to 'Modem' in the interface..."
    sed -i 's/移动数据/Modem/g' /usr/lib/lua/luci/controller/quectel.lua
    /etc/init.d/uhttpd restart
    echo "Translation applied successfully!"
}

install_modv2_design() {
    echo "Installing ModV2 Design..."
    rm -r /www/luci-static/design
    opkg update
    opkg install unrar
    wget -O /tmp/design.rar https://raw.githubusercontent.com/iFHax/QWRT_V6.5/main/design.rar
    unrar x /tmp/design.rar -d /www/luci-static/
    rm -f /tmp/design.rar
    /etc/init.d/uhttpd restart
    echo "ModV2 Design successfully installed!"
}

setup_autostart_openclash() {
    echo "Setting up OpenClash autostart..."
    echo -e "echo \"\$(date '+%Y-%m-%d %H:%M:%S') - Checked\" >> /root/rc_test.log\n/etc/openclash_autostart.sh &" >> /etc/rc.local
    wget -O /etc/openclash_autostart.sh https://raw.githubusercontent.com/iFHax/QWRT_V6.5/main/OpenClash/openclash_autostart.sh
    chmod +x /etc/openclash_autostart.sh
    echo "OpenClash autostart setup complete!"
}

# Menu
while true; do
    clear
    echo "============================"
    echo " QWRT Theme Design Manager "
    echo "============================"
    echo "1. UPDATE FAVICON"
    echo "2. FIX ICON ONLY"
    echo "3. SET DESIGN V2"
    echo "4. AUTO START OPENCLASH"
    echo "5. FIX MODEM LANGUEGE"
    echo "6. EXIT"
    echo "============================"
    read -p "Select an option (1-5): " choice

    case $choice in
        1) clear ; change_favicon ;;
        2) clear ; fix_original_theme_icon ;;
        3) clear ; install_modv2_design ;;
        4) clear ; setup_autostart_openclash ;;
        5) clear ; translet_modem_add_icon ;;
        6) clear ; echo "Exiting..."; exit 0 ;;
        *) clear ; echo "Invalid choice, please try again." ;;
    esac
    read -p "Press Enter to continue..."
done
