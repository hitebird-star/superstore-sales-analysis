# Big Idea + Storyboard

> Dokument projektowy dashboardu Sample Superstore — kontekst, główny wniosek, fakty potwierdzone w danych, narracja 3 stron.

---

## Kontekst

| Pytanie | Odpowiedź |
|---|---|
| **KTO** odbiorca? | Rekruter / hiring manager (dashboard jako portfolio) |
| **CO** ma zrobić? | Decyzja o zatrudnieniu (junior data analyst) |
| **Mechanizm** | Oba: interaktywny `.pbix` + screeny PNG do README/CV |
| **Język** | PL teraz, później osobna wersja EN (`Sample_Superstore_EN.pbix`) |

---

## Big Idea (PL)

> Wzrost sprzedaży Superstore (2014–2017) maskuje strukturalny problem rentowności: Tables (−$18k) i Bookcases zjadają cały plus pozostałych sub-kategorii Furniture, zostawiając kategorii jedynie $18k zysku przy 2,4% marży — vs Technology 17%. Decyzja: zamknąć Tables, audyt SKU z marżą <0%, alokować budżet marketingowy na Technology.

## Big Idea (EN)

> Superstore's sales growth (2014–2017) masks a structural margin problem: Tables (−$18k) and Bookcases consume the entire profit of the rest of Furniture, leaving the category at only $18k profit on 2.4% margin — vs Technology at 17%. Action: shut down Tables, audit SKUs with margin <0%, reallocate marketing to Technology.

---

## Fakty potwierdzone w danych

| Fakt | Wartość |
|---|---|
| Total sales (firma, 2014–2017) | $2,0M |
| Total profit (firma) | $286k |
| Marża firmy ogólna | 12,47% |
| Furniture: profit | +$18k |
| Furniture: sales | $742k |
| Furniture: marża | 2,4% |
| Tables: profit | −$18k |
| Technology: marża | 17% (najwyższa kategoria) |
| Copiers: marża | 37% (najwyższa sub-kategoria) |
| Cubify CubeX 3D Printer: strata | −$8,8k (pojedynczy SKU) |
| Top 20 klientów: sales | $264k |
| Top 20 klientów: udział w zysku firmy | 21% |
| Top 20 klientów: marża | 22,6% |
| West region sales | $725k |
| Central region marża | 7,92% (najniższa) |

---

## Storyboard — 3 strony (Plot → Twist → Ending)

### Strona 1 — Overview
- **Tytuł akcyjny PL:** „Sprzedaż rośnie 4 lata z rzędu, ale marża spada"
- **Tytuł akcyjny EN:** "Sales grew for 4 years, but margin dropped in 2017"
- **Główny insight:** Sales YoY+ → Margin YoY− = paradoks rentowności
- **Call-to-action:** „→ Strona 2: diagnoza produktowa"

### Strona 2 — Produkty
- **Tytuł akcyjny PL:** „Tables: −$18k zysku przy $207k sprzedaży — strukturalna strata"
- **Tytuł akcyjny EN:** "Tables: −$18k profit on $207k sales — structural loss"
- **Główny insight:** Strukturalna strata Tables + Bookcases drenują Furniture; pojedynczy SKU Cubify −$8,8k
- **Call-to-action:** „Decyzja: zamknąć Tables + audyt SKU z marżą <0"

### Strona 3 — Klienci+Geografia
- **Tytuł akcyjny PL:** „Top 20 klientów = 21% zysku firmy — retention to największa dźwignia ROI"
- **Tytuł akcyjny EN:** "Top 20 customers = 21% of company profit — retention is the biggest ROI lever"
- **Główny insight:** Mix segmentów identyczny w regionach → ekspansja geograficzna, nie segmentowa
- **Call-to-action:** „Loyalty program Top 20 + ekspansja w South (najmniejsza penetracja)"

### Logika narracji (horizontal logic)
> Sprzedaż rośnie ale marża spada → diagnoza: Tables i drukarki → ratunek: skup się na Top 20 klientach + zamknij Tables.

---

## Metodologia

Dashboard zaprojektowany w oparciu o:
- **Cole Nussbaumer Knaflic** — *Storytelling with Data* (2015): action titles, kontekst, narracja Plot–Twist–Ending
- **Stephen Few** — *Show Me the Numbers* (2012): wybór wykresu wg typu relacji, hierarchia kodowania ilości, anti-patterny (pie/donut/3D)


