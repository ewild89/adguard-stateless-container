FROM adguard/adguardhome:latest

# AdGuardHome config
COPY AdGuardHome.yaml /opt/adguardhome/conf/AdGuardHome.yaml

# Copy the entrypoint script
# Make the entrypoint script executable
COPY entrypoint.sh /opt/adguardhome/entrypoint.sh
RUN chmod +x /opt/adguardhome/entrypoint.sh
RUN chmod +x /opt/adguardhome/AdGuardHome

# 53     : TCP, UDP : DNS
# 67     :      UDP : DHCP (server)
# 68     :      UDP : DHCP (client)
# 80     : TCP      : HTTP (main)
# 443    : TCP, UDP : HTTPS, DNS-over-HTTPS (incl. HTTP/3), DNSCrypt (main)
# 853    : TCP, UDP : DNS-over-TLS, DNS-over-QUIC
# 3000   : TCP, UDP : HTTP(S) (alt, incl. HTTP/3)
# 5443   : TCP, UDP : DNSCrypt (alt)
# 6060   : TCP      : HTTP (pprof)
EXPOSE 53/tcp 53/udp 67/udp 68/udp 80/tcp 443/tcp 443/udp 853/tcp\
	853/udp 3000/tcp 3000/udp 5443/tcp 5443/udp 6060/tcp


# Set the working directory
WORKDIR /opt/adguardhome/work

# Use the script as the entrypoint
ENTRYPOINT ["/opt/adguardhome/entrypoint.sh"]