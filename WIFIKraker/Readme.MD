WiFi Kraker - Edukativna Skripta za Učenje
==========================================

Opis:
------
Ova Bash skripta služi za edukaciju i demonstraciju osnovnih koraka u napadu na WiFi mreže koristeći alate poput aircrack-ng paketa (airmon-ng, airodump-ng, aireplay-ng, aircrack-ng).

Skripta automatski bira prvi dostupni WiFi interfejs, prebacuje ga u monitor mode, skenira dostupne mreže, i omogućava pokretanje napada na WEP ili WPA/WPA2 mreže.

Važno:
-------
- Skripta je samo za učenje i testiranje na mrežama za koje imate dozvolu.
- Ne koristite je za ilegalne aktivnosti ili napade na mreže koje nisu vaše.
- Za uspješno crackanje WPA/WPA2 mreža potrebno je imati wordlist – preporučuje se rockyou.txt, koji možete pronaći i skinuti iz Kali Linux distribucije:

  /usr/share/wordlists/rockyou.txt.gz

  (datoteku je potrebno raspakirati prije korištenja, npr. gunzip rockyou.txt.gz)

Preduvjeti:
------------
- Instalirani alati iz paketa aircrack-ng (uključuje airmon-ng, airodump-ng, aireplay-ng, aircrack-ng).
- Terminal emulator xterm instaliran za pokretanje dodatnih prozora.
- Prava pristupa za pokretanje airmon-ng i ostalih mrežnih alata.
- Wordlist za crackanje (npr. rockyou.txt).

Na Debian/Ubuntu sustavima instalirajte ovako:

  sudo apt update
  sudo apt install aircrack-ng xterm

Kako koristiti:
----------------
1. Pokreni skriptu:
   
   ./WIFIKraker.sh

2. Skripta automatski odabire prvi WiFi interfejs i prebaci ga u monitor mode.
3. Prati upute na ekranu da odabereš mrežu i tip napada (WEP ili WPA/WPA2).
4. Skripta će pokrenuti potrebne alate za hvatanje handshake-a i deauth napad.
5. Nakon što imaš handshake, skripta pokreće crackanje pomoću odabranog wordlista.

Napomena:
---------
WiFi sigurnosni alati i napadi su kompleksni i ovdje su prikazani samo osnovni koraci.  
Za stvarno razumijevanje WiFi sigurnosti i etičko hakiranje preporučujemo detaljno učenje i praksu.

Autor:
-------
Email: zbaric_hr@yahoo.com

Licenca:
--------
Skripta je namijenjena isključivo za edukativne svrhe. Autor ne snosi odgovornost za neovlaštenu upotrebu.
