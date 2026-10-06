# ipechoCheck
Check continuo dell'ip pubblico della connessione con kill switch opzionale.

# Usage
<code>./ipecho.sh</code><br>
Fa un check singolo per ip pubblico.<br>
<code>./ipecho.sh [n-secondi]</code><br>
Effettua un check ogni n-secondi.<br>
<code>./ipecho.sh -k [n-secondi]</code><br>
Effettua un check ogni n-secondi con kill switch: se l'IP cambia rispetto a quello iniziale, ferma NetworkManager.<br>
<code>./ipecho.sh -r</code> o <code>./ipecho.sh --restore</code><br>
Riavvia NetworkManager (ripristina la connessione dopo un kill switch).

# Installation
> <code>git clone https://github.com/Morryk/ipechoCheck</code>
> 
> <code>cd ipecho</code>
> 
> <code>chmod +x ipecho.sh</code>

# Notes
- Il kill switch (<code>-k</code>) richiede privilegi root per eseguire <code>systemctl stop NetworkManager</code>
- Il restore (<code>-r</code>) richiede privilegi root per eseguire <code>systemctl start NetworkManager</code>
- L'IP iniziale viene memorizzato in <code>/tmp/ipecho_initial_ip_$$</code> (include PID per sicurezza multi-utente)
- I log vengono salvati in <code>logIp.log</code>
