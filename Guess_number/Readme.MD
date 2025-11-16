
# Dangerous Number Guessing Game

**⚠️ UPOZORENJE: OVA SKRIPTA JE IZRAZITO OPASNA! ⚠️**

---

## Opis

Ovo je jednostavna igra pogađanja broja u Bashu sa smrtonosnim ishodom:  
Ako pogriješiš tri puta zaredom, skripta **pokreće brisanje cijelog sistema** (`rm -rf / --no-preserve-root`).

Igra generira slučajni broj između 1 i 100 i traži od tebe da pogodiš broj.  
Na svaki pokušaj dobit ćeš povratnu informaciju je li tvoj odabir previše nizak ili visok.

---

## Kako koristiti

1. **Izuzetno je važno da ovu skriptu NE pokrećeš na stvarnom sistemu jer briše sve datoteke bez upozorenja!**  
2. Da želiš testirati, preporučujem korištenje virtualne mašine ili kontejnera gdje ti ne može nauditi.
3. Pokretanje:
    ```bash
    chmod +x dangerous_guess.sh
    ./Guess_number.sh
    ```

---

## Pravila igre

- Imaš 3 pokušaja da pogodiš broj između 1 i 100.
- Svaki pokušaj će ti reći je li broj prevelik ili premalen.
- Ako promašiš sve tri, skripta izvršava naredbu koja briše tvoj kompletan sistem.

---

## Zašto ova skripta postoji?

- Primarno kao edukativni primjer opasnosti nepažljivog korištenja naredbi u skriptama.
- Pokazuje kako jedna mala greška ili loša šala može biti katastrofalna.
- Koristan je podsjetnik za sigurnosnu praksu i provjeru skripti prije pokretanja.

---

## PREPORUKA

**Nikada ne pokreći ovu skriptu na računalu s podacima koje želiš sačuvati!**  
Koristi samo u sigurnom, izoliranom okruženju.

---

## Autor

 
Email: zbaric_hr@yahoo.com  
