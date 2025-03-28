#!/bin/sh

change_favicon() {
    echo "Changing favicon..."
    rm -f /www/luci-static/design/images/apple-touch-icon.png
    wget -q -O /www/luci-static/design/images/apple-touch-icon.png https://raw.githubusercontent.com/iFHax/QWRT-THEME/main/cat.png
    echo "Favicon successfully changed!"
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
    wget -O /tmp/luci-static-design.tar.gz https://raw.githubusercontent.com/iFHax/QWRT-THEME/main/luci-static-design.tar.gz
    unrar x /tmp/luci-static-design.tar.gz -d /www/luci-static/
    rm -f /tmp/luci-static-design.tar.gz
    /etc/init.d/uhttpd restart
    echo "ModV2 Design successfully installed!"
}

setup_autostart_openclash() {
    echo "Setting up OpenClash autostart..."
    echo -e "echo \"\$(date '+%Y-%m-%d %H:%M:%S') - Checked\" >> /root/rc_test.log\n/etc/openclash_autostart.sh &" >> /etc/rc.local
    wget -O /etc/openclash_autostart.sh https://raw.githubusercontent.com/iFHax/QWRT-THEME/main/OpenClash/openclash_autostart.sh
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
    echo "5. EXIT"
    echo "============================"
    read -p "Select an option (1-5): " choice

    case $choice in
        1) clear ; change_favicon ;;
        2) clear ; cfix_original_theme_icon ;;
        3) clear ; cinstall_modv2_design ;;
        4) clear ; csetup_autostart_openclash ;;
        5) clear ; cecho "Exiting..."; exit 0 ;;
        6) clear ; translet_modem_add_icon ;;
        *) clear ; cecho "Invalid choice, please try again." ;;
    esac
    read -p "Press Enter to continue..."
done
