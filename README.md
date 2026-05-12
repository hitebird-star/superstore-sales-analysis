# Superstore Sales Analysis

Projekt portfolio z zakresu data analytics — pełna analiza fikcyjnego sklepu **Sample Superstore** (Kaggle, 2014–2017, 9 994 zamówienia) od surowych danych po interaktywny dashboard z rekomendacjami biznesowymi.

---

## Problem biznesowy

Sprzedaż Superstore rośnie 4 lata z rzędu — czy firma faktycznie zarabia coraz więcej? Cel projektu: zdiagnozować **strukturalny problem rentowności** ukryty pod rosnącą sprzedażą i wskazać konkretne decyzje produktowe oraz klienckie do podjęcia.

**Big Idea (główny wniosek):**
> Wzrost sprzedaży maskuje strukturalny problem rentowności: Tables (−$18k) i Bookcases zjadają cały plus pozostałych sub-kategorii Furniture, zostawiając kategorii jedynie $18k zysku przy 2,4% marży — vs Technology 17%.

---

## Tech stack

- **SQL Server (SSMS)** — eksploracja, KPI, window functions, CTE, plany wykonania, indeksy
- **Excel (Microsoft 365)** — Power Query, formuły (XLOOKUP, SUMIFS, INDEX/MATCH), Pivot Tables, slicery, mini-dashboard
- **Power BI Desktop** — model gwiazdy (fact + 3 dim), DAX, Time Intelligence, RLS, Bookmarks, What-If Parameters
- **Claude (Anthropic)** — pair-programming partner: review zapytań SQL i miar DAX, troubleshooting Power Query i formuł Excela, wsparcie przy projektowaniu dashboardu wg Knaflic/Few

---

## Kluczowe analizy

1. **KPI Overview** — sprzedaż / zysk / marża / liczba klientów ogółem i w czasie
2. **Sprzedaż wg kategorii** — udział % i ranking
3. **Top 10 produktów wg zysku** + Bottom 10 (produkty ze stratą)
4. **Analiza regionalna z marżą** — które regiony dowożą rentowność
5. **Trend MoM/YoY** — sprzedaż i marża w czasie (Time Intelligence DAX)
6. **LTV per segment** — Consumer / Corporate / Home Office
7. **Discount vs marża** — wpływ rabatów na zysk (próg strat)
8. **Cohort nowi vs powracający klienci** — retention w czasie
9. **Czas dostawy** — różnica Order Date vs Ship Date wg klasy wysyłki
10. **Top 20 klientów** — ich udział w zysku firmy

---

## Kluczowe wnioski (Key Findings)

1. **Tables: −$18k zysku przy $207k sprzedaży** — strukturalna strata, nie sezonowa. Decyzja: zamknąć kategorię.
2. **Furniture jako całość: tylko 2,4% marży** — Tables i Bookcases drenują plus reszty (Chairs, Furnishings).
3. **Technology = 17% marży, Copiers 37%** — najwyższa rentowność, kierunek inwestycji.
4. **Cubify CubeX 3D Printer: −$8 880** — pojedynczy SKU generuje największą stratę produktową.
5. **Top 20 klientów = 21% zysku firmy** (przy 22,6% marży) — retention to największa dźwignia ROI; uzasadnia program lojalnościowy.

---

## Rekomendacje (Call-to-action)

- Zamknąć kategorię **Tables**
- Audyt SKU z marżą **<0%** (zacząć od Cubify)
- Realokacja budżetu marketingowego na **Technology**
- Program lojalnościowy dla **Top 20 klientów**

---

## Struktura repozytorium

```
Superstore_sales/
├── SQL/                        # zapytania analityczne
│   └── Superstore-dataset-analysis.sql
├── Excel/                      # mini-dashboard Excel
│   └── Porper_project.xlsx
├── Power BI/                   # raport Power BI
│   └── sales_superstore.pbix
├──── storyboard.md  # dokumentacja projektu                     
├── data/                       # dataset źródłowy (Kaggle)
     └── superstore.csv         
└── README.md
```

---

## Jak uruchomić projekt lokalnie


### Excel
1. Otwórz `Excel/Porper_project.xlsx` w Excelu (M365 — wymaga dynamicznych tablic dla XLOOKUP/FILTER).
2. Power Query: `Dane → Odśwież wszystko`.

### Power BI
1. Otwórz `Power BI/sales_superstore.pbix` w Power BI Desktop.
2. W razie potrzeby zaktualizuj ścieżkę do pliku CSV (Transform data → Data source settings).
3. Nawigacja: 3 strony — **Overview → Produkty → Klienci i geografia** (przyciski w lewym górnym rogu).

---

## Metodologia projektowania dashboardu

Dashboard projektowany w oparciu o:
- Cole Nussbaumer Knaflic — *Storytelling with Data* (2015) — action titles, narracja, kontekst
- Stephen Few — *Show Me the Numbers* (2012) — wybór wykresu wg typu relacji, hierarchia kodowania, anti-patterny

Zastosowane zasady:
- **Action titles** zamiast neutralnych nagłówków
- **Hierarchia szarości** — pre-attentive attributes wyróżniają kluczowe elementy
- **Brak donut/3D/pie chart** w finalnej wersji (refactor zgodny z Few)
- **Stopka What/When/Who/Where** na każdej stronie

---

## Autor

Paweł Dziedzic
