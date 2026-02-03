# listina

Applicazione **Todo List** sviluppata in **Flutter**.

---

## Panoramica

L’app consente di creare e gestire più liste di attività, aggiungere e completare task, visualizzare statistiche dettagliate e monitorare l’efficienza complessiva tramite indicatori percentuali e barre di progresso.

È pensata come progetto didattico e dimostrativo per:

* gestione dello stato
* modellazione dei dati
* costruzione di UI complesse in Flutter
* separazione tra logica, modello e presentazione

---

## Funzionalità principali

**Gestione di più liste di attività**

  * Creazione, rinomina ed eliminazione delle liste
  * Selezione rapida tramite menu a tendina

**Gestione delle attività**

  * Aggiunta di nuove attività
  * Completamento / annullamento
  * Eliminazione delle attività

**Interfaccia dinamica**

  * Tema dark personalizzato
  * Utilizzo di gradienti, card e ombre
  * Colori adattivi in base al contenuto

**Statistiche e monitoraggio**

  * Totale attività
  * Attività completate e in corso
  * Percentuale di completamento (efficienza)
  * Indicatori visivi di avanzamento

---

## Architettura dell’app

### `TodoApp`

* Punto di ingresso dell’applicazione
* Configura tema globale, Material 3 e routing

### `TodoList`

* Modello dati per una lista di attività
* Contiene:

  * Nome della lista
  * Elenco di `TodoItem`

### `TodoItem`

* Modello dati per una singola attività
* Attributi:

  * Titolo
  * Stato di completamento

### `HomePage`

* Gestisce la navigazione principale
* Bottom navigation con:

  * Schermata di gestione attività
  * Schermata statistiche

### `ListScreen`

* Schermata principale dell’app
* Funzioni:

  * Gestione delle liste
  * Inserimento e modifica delle attività
  * Rendering dinamico dell’interfaccia

### `StatsScreen`

* Calcola e visualizza statistiche
* Analisi globale e per singola lista

---

## Tecnologie utilizzate

* **Flutter**
* **Dart**
* **Material 3**

---

## Avvio del progetto

```bash
flutter pub get
flutter run
```

Prerequisiti:

* Flutter SDK aggiornato
* Emulator Android/iOS o dispositivo fisico

---

## Possibili estensioni future

* Persistenza dei dati (SQLite, Hive)
* Sincronizzazione cloud
* Notifiche e reminder
* Filtri e ordinamento avanzato
* Internazionalizzazione (i18n)

---

## Note

Il progetto è strutturato per essere facilmente estendibile e mantenibile, ed è adatto come base per applicazioni di produttività o come esempio pratico di sviluppo Flutter moderno.
