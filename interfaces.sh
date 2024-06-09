ip link set dev ens192 name blue;
ip link set dev ens224 name red;
ip link set dev ens256 name black;

# Old Alt Names
ip link property del dev blue altname 'enp11s0';
ip link property del dev red altname 'enp19s0';
ip link property del dev black altname 'enp27s0';

# New Alt Names
ip link property add dev blue altname 'Vlan20';
ip link property add dev red altname 'Vlan172';
ip link property add dev black altname 'Vlan472';
ip link property add dev lo altname 'Loopback';

# Labels
ip address add 172.30.72.129/26 dev black label black:"Web";
ip address add 172.30.72.1/25 dev red label red:"Private";
ip address add 172.20.72.1/16 dev blue label blue:"Public";

# Aliases
ip link set dev blue alias "Blue is the WAN interface on vlan 20.";
ip link set dev red alias "Red is the LAN interface for clients on vlan 172.";
ip link set dev black alias "Black is the LAN interface for web traffic on vlan 472.";
ip link set dev lo alias "Lo is the Loopback interface for internal traffic";

# Routes
ip route add default via 172.20.20.1 dev blue;
sysctl --system;

