useradd -r -G lpadmin -M cupsadmin
#Oh man super secure useless password
echo cupsadmin:cupsadmin | chpasswd
exec /usr/sbin/cupsd -f
chromium --no-sandbox
