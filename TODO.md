# Phase I

* Das Spiel hat 6 verschieden Farben für die Codes.
  * R (red)
  * Y (yellow)
  * G (green)
  * O (orange)
  * M (magenta)
  * P (purple)
* Die Bewertung der Codes ist wie folgt:
  * W (white): richtige Farbe an der falschen Position
  * B (black): richtige Farbe an der richtigen Position
* Das Spiel kann über die Kommandozeile gestartet werden. `ruby mastermind.rb`
* Nach dem Starten generiert das Programm den geheim Code (4 stellen)
* Darauf wird der Benutzer über die Kommandozeiel zur eingabe eines Codes
  aufgefordert.
* Nach der Eingabe des Codes gibt das Programm die entsprechende Bewertung aus.

Ein möglicher Programmverlauf wäre wie folgt:

```
$ ruby mastermind.rb
RRRR: BB--
RRYY: WBW-
RYRP: WBW-
YRRM: BBB-
YRRO: BBBB

Code cracked in 5 turns.
```
