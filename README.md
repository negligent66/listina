# listina

Applicazione **Todo List** sviluppata in **Flutter**.

---

## Panoramica  

 L’app consente di creare e gestire più liste di attività, aggiungere e completare task, visualizzare statistiche dettagliate e monitorare l’efficienza complessiva tramite indicatori percentuali e barre di progresso.
---

## Funzionalità principali

**Gestione di più liste di attività**

  * Creazione, rinomina ed eliminazione delle liste
  * Selezione rapida tramite menu a tendina

**Gestione delle attività**

  * Aggiunta di nuove attività
  * Completamento / annullamento
  * Eliminazione delle attività

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

## Avvio del progetto

```bash
flutter pub get
flutter run
```
