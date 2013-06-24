# Aufgabe 2

###a)
Auf einem Ihrer beiden Rechner soll der Zugang vom und zum Netzwerk 172.16.1.0/24 vollständig gesperrt werden.

	# set up
	sudo iptables -I INPUT -s 172.16.1.0/24 -j DROP
	sudo iptables -I OUTPUT -s 172.16.1.0/24 -j DROP

	# clean up
	sudo iptables -D OUTPUT -s 172.16.1.0/24 -j DROP
	sudo iptables -D INPUT -s 172.16.1.0/24 -j DROP

###b)
Stellen Sie die Firewall eines Rechners so ein, dass dort über das Netz 172.16.1.0/24 nur Ihr Chatserver genutzt werden kann. Alle anderen Verbindungen über dieses Netz sollen gesperrt sein.

	sudo iptables -I INPUT -s 172.16.1.0/24 -p tcp --dport 50000 -j ACCEPT
	sudo iptables -I OUTPUT -s 172.16.1.0/24 -p tcp --sport 50000 -j ACCEPT
	
###c)
Konfigurieren Sie einen Rechner so, dass er über das Netz 172.16.1.0/24 am Chat als Client teilnehmen, aber nicht als Server dienen kann.

	sudo /usr/sbin/iptables -I OUTPUT -s 172.16.1.0/24 -p tcp --dport 50000 -j ACCEPT
	sudo /usr/sbin/iptables -I INPUT -s 172.16.1.0/24 -p tcp --dport 50000 -j DROP	
	sudo /usr/sbin/iptables -I INPUT -s 172.16.1.0/24 -p tcp --sport 50000 -j ACCEPT
	sudo /usr/sbin/iptables -I OUTPUT -s 172.16.1.0/24 -p udp --dport 50001 -j ACCEPT
	sudo /usr/sbin/iptables -I INPUT -s 172.16.1.0/24 -p udp --dport 50001 -j ACCEPT

###d)
Stellen Sie die Firewall Ihres Rechners so ein, dass von dort ein ping auf andere Rechner/Geräte im Netz 172.16.1.0/24 möglich ist, nicht aber umgekehrt!

	sudo /usr/sbin/iptables -I OUTPUT -p icmp -m state --state NEW -j ACCEPT
	sudo /usr/sbin/iptables -I INPUT -p icmp -m state --state ESTABLISHED -j ACCEPT
	sudo /usr/sbin/iptables -I INPUT -p icmp -m state --state NEW -j DROP

# Aufgabe 3

	# Routing through router
	sudo /sbin/route add -net 192.168.17.0/24 gw 192.168.18.2
	sudo /sbin/route add -net 192.168.18.0/24 gw 192.168.17.2

	# Routing through isdn router
	sudo /sbin/route add -net 192.168.17.0/24 gw 192.168.18.1
	sudo /sbin/route add -net 192.168.18.0/24 gw 192.168.17.1

## Festellungen
Beim senden einer Ping Anfrage mit 1000Bytes uber die ISDN anlagen werden die Packete fragmentiert. (Frag needed and DF set, mtu=786)

`ping -s 1000 192.168.17.4`

Die tritt bei einer ping anfrage ohne die ISDN anlage nicht auf.

# Aufgabe 4

###a)
Zeichnen Sie mit wireshark (Netzwerksniffer) den Netzwerkverkehr der TCP­Verbindung über das Netz 172.16.1.0/24 zwischen Ihrem Chatserver und einem Client auf einem anderen Rechner auf. Dokumentieren Sie Verbindungsaufbau und ­abbau.

	"No.","Time","Source","Destination","Protocol","Length","Info"
	"566","22.580157000","172.16.1.4","172.16.1.3","TCP","74","33822 > mrt [SYN] Seq=0 Win=14600 Len=0 MSS=1460 SACK_PERM=1 TSval=3571807 TSecr=0 WS=32"
	"567","22.580189000","172.16.1.3","172.16.1.4","TCP","74","mrt > 33822 [SYN, ACK] Seq=0 Ack=1 Win=14480 Len=0 MSS=1460 SACK_PERM=1 TSval=2446543 TSecr=3571807 WS=32"
	"568","22.580396000","172.16.1.4","172.16.1.3","TCP","66","33822 > mrt [ACK] Seq=1 Ack=1 Win=14624 Len=0 TSval=3571807 TSecr=2446543"
	"570","22.600541000","172.16.1.4","172.16.1.3","TCP","77","33822 > mrt [PSH, ACK] Seq=1 Ack=1 Win=14624 Len=11 TSval=3571812 TSecr=2446543"
	"571","22.600607000","172.16.1.3","172.16.1.4","TCP","66","mrt > 33822 [ACK] Seq=1 Ack=12 Win=14496 Len=0 TSval=2446549 TSecr=3571812"
	"572","22.609367000","172.16.1.3","172.16.1.4","TCP","69","mrt > 33822 [PSH, ACK] Seq=1 Ack=12 Win=14496 Len=3 TSval=2446551 TSecr=3571812"
	"573","22.609482000","172.16.1.4","172.16.1.3","TCP","66","33822 > mrt [ACK] Seq=12 Ack=4 Win=14624 Len=0 TSval=3571815 TSecr=2446551"
	"574","22.612701000","172.16.1.4","172.16.1.3","TCP","71","33822 > mrt [PSH, ACK] Seq=12 Ack=4 Win=14624 Len=5 TSval=3571815 TSecr=2446551"
	"575","22.618034000","172.16.1.3","172.16.1.4","TCP","91","mrt > 33822 [PSH, ACK] Seq=4 Ack=17 Win=14496 Len=25 TSval=2446553 TSecr=3571815"
	"577","22.657407000","172.16.1.4","172.16.1.3","TCP","66","33822 > mrt [ACK] Seq=17 Ack=29 Win=14624 Len=0 TSval=3571827 TSecr=2446553"
	"627","24.621578000","172.16.1.4","172.16.1.3","TCP","71","33822 > mrt [PSH, ACK] Seq=17 Ack=29 Win=14624 Len=5 TSval=3572318 TSecr=2446553"
	"628","24.622401000","172.16.1.3","172.16.1.4","TCP","91","mrt > 33822 [PSH, ACK] Seq=29 Ack=22 Win=14496 Len=25 TSval=2447054 TSecr=3572318"
	"629","24.622515000","172.16.1.4","172.16.1.3","TCP","66","33822 > mrt [ACK] Seq=22 Ack=54 Win=14624 Len=0 TSval=3572318 TSecr=2447054"
	"677","26.505611000","172.16.1.4","172.16.1.3","TCP","70","33822 > mrt [PSH, ACK] Seq=22 Ack=54 Win=14624 Len=4 TSval=3572789 TSecr=2447054"
	"678","26.506495000","172.16.1.4","172.16.1.3","TCP","66","33822 > mrt [FIN, ACK] Seq=26 Ack=54 Win=14624 Len=0 TSval=3572789 TSecr=2447054"
	"679","26.508354000","172.16.1.3","172.16.1.4","TCP","70","mrt > 33822 [PSH, ACK] Seq=54 Ack=27 Win=14496 Len=4 TSval=2447525 TSecr=3572789"
	"680","26.508471000","172.16.1.4","172.16.1.3","TCP","60","33822 > mrt [RST] Seq=27 Win=0 Len=0"
	
###b)
Setzen Sie dann auf Ihrem Chatserver­Rechner die Filterregeln für vollständige Abschottung (aus Teilaufgabe 2) in Kraft. Zeichnen Sie erneut den Netzwerkverkehr auf. Wie reagiert der Chatclient?

	"No.","Time","Source","Destination","Protocol","Length","Info"
	"416","16.579291000","172.16.1.4","172.16.1.3","TCP","74","33823 > mrt [SYN] Seq=0 Win=14600 Len=0 MSS=1460 SACK_PERM=1 TSval=3685237 TSecr=0 WS=32"
	"442","17.575634000","172.16.1.4","172.16.1.3","TCP","74","33823 > mrt [SYN] Seq=0 Win=14600 Len=0 MSS=1460 SACK_PERM=1 TSval=3685487 TSecr=0 WS=32"
	"493","19.579630000","172.16.1.4","172.16.1.3","TCP","74","33823 > mrt [SYN] Seq=0 Win=14600 Len=0 MSS=1460 SACK_PERM=1 TSval=3685988 TSecr=0 WS=32"
	"596","23.587637000","172.16.1.4","172.16.1.3","TCP","74","33823 > mrt [SYN] Seq=0 Win=14600 Len=0 MSS=1460 SACK_PERM=1 TSval=3686990 TSecr=0 WS=32"
	"797","31.595648000","172.16.1.4","172.16.1.3","TCP","74","33823 > mrt [SYN] Seq=0 Win=14600 Len=0 MSS=1460 SACK_PERM=1 TSval=3688992 TSecr=0 WS=32"
	
###c)
Modifizieren Sie Ihre Filterregeln so, dass der Chatclient­Rechner ein Antwortpaket erhält, in dem das RESET­Flag gesetzt ist. Zeichnen Sie auch hierzu den Netzwerkverkehr auf. Wie reagiert der Chatclient?

	sudo /usr/sbin/iptables -I INPUT -s 172.16.1.0/24 -p tcp --dport 50000 -j REJECT --reject-with tcp-reset
	sudo /usr/sbin/iptables -I OUTPUT -s 172.16.1.0/24 -p tcp --sport 50000 -j ACCEPT

	"No.","Time","Source","Destination","Protocol","Length","Info"
	"4937","277.887078000","172.16.1.4","172.16.1.3","TCP","74","33826 > mrt [SYN] Seq=0 Win=14600 Len=0 MSS=1460 SACK_PERM=1 TSval=3922914 TSecr=0 WS=32"
	"4938","277.887103000","172.16.1.3","172.16.1.4","TCP","54","mrt > 33826 [RST, ACK] Seq=1 Ack=1 Win=0 Len=0"
