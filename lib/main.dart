import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

void main() {
  runApp(const TodoApp());
}

// Widget radice dell'app: configura il tema globale e imposta HomePage come schermata iniziale.
class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dragon Ball TO DO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFFFF8C00),          // Arancione Dragon Ball
        scaffoldBackgroundColor: const Color(0xFF1A1A2E),
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFFFF8C00),
          secondary: const Color(0xFFFFD700),            // Oro Super Saiyan
          surface: const Color(0xFF16213E),
          background: const Color(0xFF0F3460),
        ),
        cardTheme: CardThemeData(
          color: const Color(0xFF16213E),
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(color: Color(0xFFFF8C00), width: 2),
          ),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

// Modello per una lista di todo (es. "Missione Namek", "Allenamento").
// Ogni lista ha un nome e una lista di TodoItem.
class TodoList {
  String name;
  List<TodoItem> items;

  TodoList({required this.name, List<TodoItem>? items})
      : items = items ?? [];

  // Serializza la lista in Map per il salvataggio in JSON su SharedPreferences
  Map<String, dynamic> toJson() => {
    'name': name,
    'items': items.map((item) => item.toJson()).toList(),
  };

  // Crea una TodoList a partire da un Map JSON (usato al caricamento)
  factory TodoList.fromJson(Map<String, dynamic> json) => TodoList(
    name: json['name'],
    items: (json['items'] as List)
        .map((item) => TodoItem.fromJson(item))
        .toList(),
  );

  // Easter egg: se il nome della lista contiene il nome di un personaggio di Dragon Ball,
  // restituisce una palette di colori tematici da applicare alla UI.
  // Restituisce null se non viene trovato nessun match.
  //
  // ATTENZIONE all'ordine dei controlli: quelli più specifici devono venire PRIMA
  // di quelli generici. Esempio: "goku black" deve essere controllato prima di "goku",
  // altrimenti "goku" matcha per primo e la palette sbagliata viene restituita.
  Map<String, dynamic>? getThemeColors() {
    final lowerName = name.toLowerCase();

    // Goku Black / Zamasu - Rosa/Nero (PRIMA di "goku" generico!)
    if (lowerName.contains('goku black') ||
        lowerName.contains('black') ||
        lowerName.contains('zamasu') ||
        lowerName.contains('rose')) {
      return {
        'primary': const Color(0xFFFF1493),
        'secondary': const Color(0xFF000000),
        'accent': const Color(0xFFFF69B4),
      };
    }

    // Ultra Instinct / Migatte no Gokui - Argento/Bianco (PRIMA di varianti generiche "UI")
    if (lowerName.contains('ultra instinct') || lowerName.contains('migatte')) {
      return {
        'primary': const Color(0xFFC0C0C0),
        'secondary': const Color(0xFFFFFFFF),
        'accent': const Color(0xFFE8E8E8),
      };
    }

    // Cooler / Final Form - Rosso scuro e Bianco
    if (lowerName.contains('cooler') || lowerName.contains('final form')) {
      return {
        'primary': const Color(0xFF8B0000),
        'secondary': const Color(0xFFFFFFFF),
        'accent': const Color(0xFFDC143C),
      };
    }

    // Goku / Super Saiyan / SSJ - Giallo/Oro
    if (lowerName.contains('goku') ||
        lowerName.contains('super saiyan') ||
        lowerName.contains('ssj')) {
      return {
        'primary': const Color(0xFFFFD700),
        'secondary': const Color(0xFFFFA500),
        'accent': const Color(0xFFFFFF00),
      };
    }

    // Vegeta - Blu navy
    if (lowerName.contains('vegeta')) {
      return {
        'primary': const Color(0xFF000080),
        'secondary': const Color(0xFF4169E1),
        'accent': const Color(0xFF1E90FF),
      };
    }

    // Piccolo / Namek - Verde
    if (lowerName.contains('piccolo') || lowerName.contains('namek')) {
      return {
        'primary': const Color(0xFF228B22),
        'secondary': const Color(0xFF32CD32),
        'accent': const Color(0xFF00FF00),
      };
    }

    // Freezer / Frieza - Viola e Bianco
    if (lowerName.contains('freezer') || lowerName.contains('frieza')) {
      return {
        'primary': const Color(0xFF8B008B),
        'secondary': const Color(0xFFFFFFFF),
        'accent': const Color(0xFFDA70D6),
      };
    }

    // Cell - Verde acido
    if (lowerName.contains('cell')) {
      return {
        'primary': const Color(0xFF7FFF00),
        'secondary': const Color(0xFF00FF7F),
        'accent': const Color(0xFF39FF14),
      };
    }

    // Majin Buu - Rosa
    if (lowerName.contains('buu') || lowerName.contains('majin')) {
      return {
        'primary': const Color(0xFFFF69B4),
        'secondary': const Color(0xFFFFB6C1),
        'accent': const Color(0xFFFF1493),
      };
    }

    // Broly - Verde lime
    if (lowerName.contains('broly')) {
      return {
        'primary': const Color(0xFF00FF00),
        'secondary': const Color(0xFF7FFF00),
        'accent': const Color(0xFFADFF2F),
      };
    }

    // Gohan - Rosso/Arancione
    if (lowerName.contains('gohan')) {
      return {
        'primary': const Color(0xFFFF4500),
        'secondary': const Color(0xFFFF6347),
        'accent': const Color(0xFFFF7F50),
      };
    }

    // Trunks - Blu chiaro/Lavanda
    if (lowerName.contains('trunks')) {
      return {
        'primary': const Color(0xFF87CEEB),
        'secondary': const Color(0xFFE6E6FA),
        'accent': const Color(0xFF6495ED),
      };
    }

    // Hit - Viola scuro
    if (lowerName.contains('hit')) {
      return {
        'primary': const Color(0xFF4B0082),
        'secondary': const Color(0xFF9370DB),
        'accent': const Color(0xFF8A2BE2),
      };
    }

    // Jiren - Grigio/Rosso
    if (lowerName.contains('jiren')) {
      return {
        'primary': const Color(0xFF808080),
        'secondary': const Color(0xFFFF0000),
        'accent': const Color(0xFFC0C0C0),
      };
    }

    // Beerus - Viola
    if (lowerName.contains('beerus')) {
      return {
        'primary': const Color(0xFF9932CC),
        'secondary': const Color(0xFFBA55D3),
        'accent': const Color(0xFFDA70D6),
      };
    }

    // Whis - Blu celeste
    if (lowerName.contains('whis')) {
      return {
        'primary': const Color(0xFF00BFFF),
        'secondary': const Color(0xFF87CEEB),
        'accent': const Color(0xFF1E90FF),
      };
    }

    return null; // Nessun personaggio riconosciuto: usa il tema di default
  }
}

// Modello per un singolo task all'interno di una TodoList.
class TodoItem {
  String title;
  bool isCompleted; // true = task completato, false = ancora da fare

  TodoItem({required this.title, this.isCompleted = false});

  // Serializza il task in Map per il salvataggio JSON
  Map<String, dynamic> toJson() => {
    'title': title,
    'isCompleted': isCompleted,
  };

  // Crea un TodoItem a partire da un Map JSON
  factory TodoItem.fromJson(Map<String, dynamic> json) => TodoItem(
    title: json['title'],
    isCompleted: json['isCompleted'],
  );

  // Easter egg: identica logica di getThemeColors() di TodoList,
  // ma applicata al titolo del singolo task invece che al nome della lista.
  // Permette di colorare ogni singola card in base al suo contenuto.
  Map<String, dynamic>? getThemeColors() {
    final lowerTitle = title.toLowerCase();

    // Stessa logica e stesso ordine di priorità di TodoList.getThemeColors().
    // I controlli specifici vengono prima di quelli generici per evitare falsi match.

    if (lowerTitle.contains('goku black') ||
        lowerTitle.contains('black') ||
        lowerTitle.contains('zamasu') ||
        lowerTitle.contains('rose')) {
      return {
        'primary': const Color(0xFFFF1493),
        'secondary': const Color(0xFF000000),
        'accent': const Color(0xFFFF69B4),
      };
    }

    if (lowerTitle.contains('ultra instinct') || lowerTitle.contains('migatte')) {
      return {
        'primary': const Color(0xFFC0C0C0),
        'secondary': const Color(0xFFFFFFFF),
        'accent': const Color(0xFFE8E8E8),
      };
    }

    if (lowerTitle.contains('cooler') || lowerTitle.contains('final form')) {
      return {
        'primary': const Color(0xFF8B0000),
        'secondary': const Color(0xFFFFFFFF),
        'accent': const Color(0xFFDC143C),
      };
    }

    if (lowerTitle.contains('goku') ||
        lowerTitle.contains('super saiyan') ||
        lowerTitle.contains('ssj')) {
      return {
        'primary': const Color(0xFFFFD700),
        'secondary': const Color(0xFFFFA500),
        'accent': const Color(0xFFFFFF00),
      };
    }

    if (lowerTitle.contains('vegeta')) {
      return {
        'primary': const Color(0xFF000080),
        'secondary': const Color(0xFF4169E1),
        'accent': const Color(0xFF1E90FF),
      };
    }

    if (lowerTitle.contains('piccolo') || lowerTitle.contains('namek')) {
      return {
        'primary': const Color(0xFF228B22),
        'secondary': const Color(0xFF32CD32),
        'accent': const Color(0xFF00FF00),
      };
    }

    if (lowerTitle.contains('freezer') || lowerTitle.contains('frieza')) {
      return {
        'primary': const Color(0xFF8B008B),
        'secondary': const Color(0xFFFFFFFF),
        'accent': const Color(0xFFDA70D6),
      };
    }

    if (lowerTitle.contains('cell')) {
      return {
        'primary': const Color(0xFF7FFF00),
        'secondary': const Color(0xFF00FF7F),
        'accent': const Color(0xFF39FF14),
      };
    }

    if (lowerTitle.contains('buu') || lowerTitle.contains('majin')) {
      return {
        'primary': const Color(0xFFFF69B4),
        'secondary': const Color(0xFFFFB6C1),
        'accent': const Color(0xFFFF1493),
      };
    }

    if (lowerTitle.contains('broly')) {
      return {
        'primary': const Color(0xFF00FF00),
        'secondary': const Color(0xFF7FFF00),
        'accent': const Color(0xFFADFF2F),
      };
    }

    if (lowerTitle.contains('gohan')) {
      return {
        'primary': const Color(0xFFFF4500),
        'secondary': const Color(0xFFFF6347),
        'accent': const Color(0xFFFF7F50),
      };
    }

    if (lowerTitle.contains('trunks')) {
      return {
        'primary': const Color(0xFF87CEEB),
        'secondary': const Color(0xFFE6E6FA),
        'accent': const Color(0xFF6495ED),
      };
    }

    if (lowerTitle.contains('hit')) {
      return {
        'primary': const Color(0xFF4B0082),
        'secondary': const Color(0xFF9370DB),
        'accent': const Color(0xFF8A2BE2),
      };
    }

    if (lowerTitle.contains('jiren')) {
      return {
        'primary': const Color(0xFF808080),
        'secondary': const Color(0xFFFF0000),
        'accent': const Color(0xFFC0C0C0),
      };
    }

    if (lowerTitle.contains('beerus')) {
      return {
        'primary': const Color(0xFF9932CC),
        'secondary': const Color(0xFFBA55D3),
        'accent': const Color(0xFFDA70D6),
      };
    }

    if (lowerTitle.contains('whis')) {
      return {
        'primary': const Color(0xFF00BFFF),
        'secondary': const Color(0xFF87CEEB),
        'accent': const Color(0xFF1E90FF),
      };
    }

    return null;
  }
}

// Widget radice della navigazione principale.
// Gestisce le due schermate (Liste e Statistiche) tramite una NavigationBar in basso.
// Contiene lo stato globale: tutte le liste e l'indice della lista selezionata.
// I dati vengono caricati/salvati su SharedPreferences (persistenza locale).
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; // Indice della tab attiva (0 = Liste, 1 = Statistiche)
  List<TodoList> _todoLists = [
    TodoList(name: '🐉 Lista Principale'), // Lista di default al primo avvio
  ];
  int _selectedListIndex = 0; // Indice della lista attualmente visualizzata in ListScreen

  @override
  void initState() {
    super.initState();
    _loadData(); // Carica i dati salvati non appena il widget è pronto
  }

  // Carica le liste salvate da SharedPreferences.
  // Se non c'è nulla salvato, mantiene la lista di default.
  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final String? data = prefs.getString('todoLists');

    if (data != null) {
      final List<dynamic> jsonList = json.decode(data);
      setState(() {
        _todoLists = jsonList.map((json) => TodoList.fromJson(json)).toList();
        // Fallback: se il JSON era vuoto, ricrea la lista di default
        if (_todoLists.isEmpty) {
          _todoLists = [TodoList(name: '🐉 Lista Principale')];
        }
      });
    }
  }

  // Serializza tutte le liste in JSON e le salva su SharedPreferences.
  // Va chiamata dopo ogni modifica (aggiunta/eliminazione lista o task, toggle, ecc.).
  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    final String data =
    json.encode(_todoLists.map((list) => list.toJson()).toList());
    await prefs.setString('todoLists', data);
  }

  @override
  Widget build(BuildContext context) {
    // Le schermate vengono ricreate ad ogni build per ricevere lo stato aggiornato.
    // Le callback (onAddList, onDeleteItem, ecc.) modificano lo stato qui in HomePage
    // e poi chiamano _saveData() per persistere i cambiamenti.
    final List<Widget> screens = [
      ListScreen(
        todoLists: _todoLists,
        selectedListIndex: _selectedListIndex,

        // Cambia la lista visualizzata nel dropdown
        onListChanged: (index) {
          setState(() => _selectedListIndex = index);
        },

        // Crea una nuova lista con il nome fornito
        onAddList: (name) {
          setState(() {
            _todoLists.add(TodoList(name: name));
            _saveData();
          });
        },

        // Elimina la lista all'indice dato; aggiusta l'indice selezionato se necessario
        onDeleteList: (index) {
          setState(() {
            if (_todoLists.length > 1) {
              _todoLists.removeAt(index);
              if (_selectedListIndex >= _todoLists.length) {
                _selectedListIndex = _todoLists.length - 1;
              }
              _saveData();
            }
          });
        },

        // Rinomina la lista all'indice dato con il nuovo nome
        onRenameList: (index, newName) {
          setState(() {
            _todoLists[index].name = newName;
            _saveData();
          });
        },

        // Aggiunge un nuovo task alla lista correntemente selezionata
        onAddItem: (item) {
          setState(() {
            _todoLists[_selectedListIndex].items.add(item);
            _saveData();
          });
        },

        // Inverte lo stato completato/non completato del task all'indice dato
        onToggleItem: (index) {
          setState(() {
            _todoLists[_selectedListIndex].items[index].isCompleted =
            !_todoLists[_selectedListIndex].items[index].isCompleted;
            _saveData();
          });
        },

        // Elimina il task all'indice dato dalla lista corrente
        onDeleteItem: (index) {
          setState(() {
            _todoLists[_selectedListIndex].items.removeAt(index);
            _saveData();
          });
        },
      ),
      // La schermata statistiche riceve tutte le liste in sola lettura
      StatsScreen(todoLists: _todoLists),
    ];

    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color(0xFF16213E), const Color(0xFF0F3460)],
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFFF8C00).withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: NavigationBar(
          selectedIndex: _currentIndex,
          backgroundColor: Colors.transparent,
          onDestinationSelected: (index) {
            setState(() => _currentIndex = index);
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.format_list_bulleted, color: Colors.white70),
              selectedIcon: Icon(Icons.format_list_bulleted, color: Colors.white),
              label: 'Missioni',
            ),
            NavigationDestination(
              icon: Icon(Icons.bar_chart, color: Colors.white70),
              selectedIcon: Icon(Icons.bar_chart, color: Colors.white),
              label: 'Livello',
            ),
          ],
        ),
      ),
    );
  }
}

// Schermata principale con la lista dei task.
// Riceve i dati e le callback da HomePage via costruttore (pattern "lifting state up"):
// lo stato vive in HomePage, ListScreen lo legge e notifica i cambiamenti tramite callback.
class ListScreen extends StatefulWidget {
  final List<TodoList> todoLists;
  final int selectedListIndex;
  final Function(int) onListChanged;
  final Function(String) onAddList;
  final Function(int) onDeleteList;
  final Function(int, String) onRenameList;
  final Function(TodoItem) onAddItem;
  final Function(int) onToggleItem;
  final Function(int) onDeleteItem;

  const ListScreen({
    Key? key,
    required this.todoLists,
    required this.selectedListIndex,
    required this.onListChanged,
    required this.onAddList,
    required this.onDeleteList,
    required this.onRenameList,
    required this.onAddItem,
    required this.onToggleItem,
    required this.onDeleteItem,
  }) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  // Controller per il campo di testo "aggiungi nuovo task"
  final TextEditingController _controller = TextEditingController();

  // Mostra il dialog per creare una nuova lista
  void _showAddListDialog() {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Color(0xFFFF8C00), width: 2),
        ),
        backgroundColor: const Color(0xFF16213E),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Nuova Missione',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFD700),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: controller,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Nome della missione...',
                  hintStyle: const TextStyle(color: Colors.white54),
                  filled: true,
                  fillColor: const Color(0xFF0F3460),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Color(0xFFFF8C00)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Color(0xFFFF8C00)),
                  ),
                ),
                autofocus: true,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Annulla',
                        style: TextStyle(color: Colors.white70)),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (controller.text.isNotEmpty) {
                        widget.onAddList(controller.text);
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF8C00),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text('Crea',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Mostra il dialog per rinominare la lista attualmente selezionata.
  // Pre-compila il campo con il nome attuale.
  void _showRenameListDialog() {
    final controller = TextEditingController(
      text: widget.todoLists[widget.selectedListIndex].name,
    );
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Color(0xFFFF8C00), width: 2),
        ),
        backgroundColor: const Color(0xFF16213E),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Rinomina Lista',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFD700),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: controller,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Nuovo nome...',
                  hintStyle: const TextStyle(color: Colors.white54),
                  filled: true,
                  fillColor: const Color(0xFF0F3460),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Color(0xFFFF8C00)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Color(0xFFFF8C00)),
                  ),
                ),
                autofocus: true,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Annulla',
                        style: TextStyle(color: Colors.white70)),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (controller.text.isNotEmpty) {
                        widget.onRenameList(
                            widget.selectedListIndex, controller.text);
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF8C00),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text('Salva',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Aggiunge un nuovo task con il testo del campo di input, se non è vuoto.
  // Svuota il campo dopo l'aggiunta.
  void _addTodoItem() {
    if (_controller.text.isNotEmpty) {
      widget.onAddItem(TodoItem(title: _controller.text));
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentList = widget.todoLists[widget.selectedListIndex];

    // Recupera la palette dell'easter egg per la lista corrente.
    // Se null (nessun personaggio trovato), usa i colori di default arancione/oro.
    final themeColors = currentList.getThemeColors();
    final primaryColor = themeColors?['primary'] ?? const Color(0xFFFF8C00);
    final secondaryColor = themeColors?['secondary'] ?? const Color(0xFFFFD700);
    final accentColor = themeColors?['accent'] ?? const Color(0xFFFF8C00);

    return Scaffold(
      appBar: AppBar(
        // Gradiente dinamico: cambia colore in base all'easter egg della lista
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [primaryColor, secondaryColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Row(
          children: [
            Expanded(
              // Dropdown per selezionare la lista attiva tra quelle disponibili
              child: Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: DropdownButton<int>(
                  value: widget.selectedListIndex,
                  underline: Container(), // Nasconde la linea sottostante di default
                  isExpanded: true,
                  dropdownColor: const Color(0xFF16213E),
                  items: List.generate(
                    widget.todoLists.length,
                        (index) => DropdownMenuItem(
                      value: index,
                      child: Text(
                        widget.todoLists[index].name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    if (value != null) widget.onListChanged(value);
                  },
                ),
              ),
            ),
          ],
        ),
        actions: [
          // Bottone per rinominare la lista selezionata
          Container(
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: _showRenameListDialog,
              tooltip: 'Rinomina Lista',
              color: Colors.white,
            ),
          ),

          // Bottone per eliminare la lista (visibile solo se ci sono almeno 2 liste:
          // non si può eliminare l'ultima lista rimasta)
          if (widget.todoLists.length > 1)
            Container(
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  // Dialog di conferma prima di eliminare (azione distruttiva)
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: primaryColor, width: 2),
                      ),
                      backgroundColor: const Color(0xFF16213E),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.warning_amber,
                                color: Colors.red, size: 50),
                            const SizedBox(height: 16),
                            const Text(
                              'Eliminare questa lista?',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Eliminerai "${widget.todoLists[widget.selectedListIndex].name}" e tutti i suoi task',
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.white70),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Annulla',
                                      style:
                                      TextStyle(color: Colors.white70)),
                                ),
                                const SizedBox(width: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    widget.onDeleteList(
                                        widget.selectedListIndex);
                                    Navigator.pop(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  child: const Text('Elimina',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                tooltip: 'Elimina Lista',
                color: Colors.white,
              ),
            ),

          // Bottone per aggiungere una nuova lista
          Container(
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: const Icon(Icons.add_circle),
              onPressed: _showAddListDialog,
              tooltip: 'Nuova Missione',
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // --- AREA INPUT NUOVO TASK ---
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [primaryColor.withOpacity(0.2), Colors.transparent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: accentColor.withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _controller,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Inserisci nuova sfida...',
                        hintStyle: const TextStyle(color: Colors.white54),
                        filled: true,
                        fillColor: const Color(0xFF16213E),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                          BorderSide(color: primaryColor, width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                          BorderSide(color: primaryColor, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                          BorderSide(color: secondaryColor, width: 2),
                        ),
                      ),
                      // Permette di aggiungere il task anche premendo "Invio" sulla tastiera
                      onSubmitted: (_) => _addTodoItem(),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // Bottone AGGIUNGI con gradiente dinamico basato sul tema corrente
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [primaryColor, secondaryColor]),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: accentColor.withOpacity(0.5),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: _addTodoItem,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.add_task, color: Colors.white),
                        SizedBox(width: 8),
                        Text('AGGIUNGI',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // --- LISTA DEI TASK ---
          Expanded(
            child: currentList.items.isEmpty
            // Schermata vuota: icona e testo di invito ad aggiungere task
                ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          primaryColor.withOpacity(0.3),
                          secondaryColor.withOpacity(0.3),
                        ],
                      ),
                    ),
                    child: Icon(Icons.military_tech,
                        size: 80, color: accentColor),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Nessuna missione attiva',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Inizia ad aggiungere le tue sfide!',
                    style: TextStyle(fontSize: 14, color: Colors.white54),
                  ),
                ],
              ),
            )
            // Lista dei task: ogni item è una Card con checkbox e bottone elimina
                : ListView.builder(
              padding: const EdgeInsets.symmetric(
                  horizontal: 12, vertical: 8),
              itemCount: currentList.items.length,
              itemBuilder: (context, index) {
                final item = currentList.items[index];

                // Ogni task può avere la propria palette dall'easter egg
                final itemColors = item.getThemeColors();
                final itemPrimary =
                    itemColors?['primary'] ?? primaryColor;
                final itemAccent = itemColors?['accent'] ?? accentColor;

                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        // Task completato: ombra verde; task attivo: ombra colorata
                        color: item.isCompleted
                            ? const Color(0xFF4CAF50).withOpacity(0.3)
                            : itemAccent.withOpacity(0.4),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Card(
                    margin: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        // Bordo verde se completato, colorato se attivo
                        color: item.isCompleted
                            ? const Color(0xFF4CAF50)
                            : itemPrimary,
                        width: 2,
                      ),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      leading: Transform.scale(
                        scale: 1.3, // Ingrandisce leggermente il checkbox
                        child: Checkbox(
                          value: item.isCompleted,
                          onChanged: (_) => widget.onToggleItem(index),
                          activeColor: const Color(0xFF4CAF50),
                          checkColor: Colors.white,
                          side: BorderSide(color: itemPrimary, width: 2),
                        ),
                      ),
                      title: Text(
                        item.title,
                        style: TextStyle(
                          // Testo barrato e sbiadito se il task è completato
                          decoration: item.isCompleted
                              ? TextDecoration.lineThrough
                              : null,
                          color: item.isCompleted
                              ? Colors.white60
                              : Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete_forever,
                            color: Colors.red),
                        onPressed: () => widget.onDeleteItem(index),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Libera le risorse del TextEditingController
    super.dispose();
  }
}

// Schermata statistiche: mostra il "Power Level" globale e per ogni lista.
// È stateless perché non modifica dati, si limita a leggerli e visualizzarli.
class StatsScreen extends StatelessWidget {
  final List<TodoList> todoLists;

  const StatsScreen({Key? key, required this.todoLists}) : super(key: key);

  // Calcola le statistiche (totale, completati, da fare, percentuale) per una lista.
  Map<String, int> _calculateStats(TodoList list) {
    int total = list.items.length;
    int completed = list.items.where((item) => item.isCompleted).length;
    int pending = total - completed;
    // "Efficiency" = percentuale di completamento arrotondata
    int efficiency = total > 0 ? ((completed / total) * 100).round() : 0;

    return {
      'total': total,
      'completed': completed,
      'pending': pending,
      'efficiency': efficiency,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFF8C00), Color(0xFFFFD700)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: const Row(
          children: [
            Icon(Icons.emoji_events, color: Colors.white),
            SizedBox(width: 10),
            Text('Power Level',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      // Lista che mostra prima il riepilogo globale (index 0),
      // poi una card per ogni singola lista (index 1..N)
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: todoLists.length + 1, // +1 per la card globale
        itemBuilder: (context, index) {
          // --- CARD RIEPILOGO GLOBALE (prima card) ---
          if (index == 0) {
            // Calcola i totali sommando i dati di tutte le liste
            int totalAll = 0;
            int completedAll = 0;

            for (var list in todoLists) {
              totalAll += list.items.length;
              completedAll +=
                  list.items.where((item) => item.isCompleted).length;
            }

            int pendingAll = totalAll - completedAll;
            int efficiencyAll = totalAll > 0
                ? ((completedAll / totalAll) * 100).round()
                : 0;

            return Container(
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFFFF8C00).withOpacity(0.8),
                    const Color(0xFFFFD700).withOpacity(0.8),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFF8C00).withOpacity(0.5),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Card(
                margin: EdgeInsets.zero,
                color: Colors.transparent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.trending_up, color: Colors.white, size: 30),
                          SizedBox(width: 10),
                          Text(
                            'LIVELLO GLOBALE',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 2,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      _buildStatRow(Icons.stars, 'Missioni Totali',
                          totalAll.toString(), Colors.white),
                      _buildStatRow(Icons.check_circle, 'Completate',
                          completedAll.toString(), const Color(0xFF4CAF50)),
                      _buildStatRow(Icons.pending_actions, 'In Corso',
                          pendingAll.toString(), const Color(0xFFFFEB3B)),
                      _buildStatRow(Icons.flash_on, 'Power Level',
                          '$efficiencyAll%', const Color(0xFFFFD700)),
                      const SizedBox(height: 16),
                      // Barra di avanzamento globale
                      Container(
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white24,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF4CAF50),
                                      Color(0xFF8BC34A)
                                    ],
                                  ),
                                ),
                                // FractionallySizedBox: occupa una percentuale della larghezza
                                // proporzionale ai task completati
                                child: FractionallySizedBox(
                                  widthFactor: totalAll > 0
                                      ? completedAll / totalAll
                                      : 0,
                                  alignment: Alignment.centerLeft,
                                  child: Container(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }

          // --- CARD PER OGNI LISTA (card successive) ---
          final list = todoLists[index - 1]; // index-1 perché index 0 è la card globale
          final stats = _calculateStats(list);

          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFFF8C00).withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Card(
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side:
                const BorderSide(color: Color(0xFFFF8C00), width: 2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.folder_special,
                            color: Color(0xFFFFD700), size: 24),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            list.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFFD700),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                        color: Color(0xFFFF8C00), thickness: 2, height: 24),
                    _buildStatRow(Icons.stars, 'Totali',
                        stats['total'].toString(), Colors.white70),
                    _buildStatRow(Icons.check_circle, 'Completate',
                        stats['completed'].toString(),
                        const Color(0xFF4CAF50)),
                    _buildStatRow(Icons.pending_actions, 'Da Fare',
                        stats['pending'].toString(),
                        const Color(0xFFFFEB3B)),
                    _buildStatRow(Icons.flash_on, 'Potenza',
                        '${stats['efficiency']}%', const Color(0xFFFFD700)),
                    const SizedBox(height: 12),
                    // Barra di avanzamento per la singola lista
                    Container(
                      height: 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xFF0F3460),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: LinearProgressIndicator(
                          value: stats['total']! > 0
                              ? stats['completed']! / stats['total']!
                              : 0,
                          backgroundColor: Colors.transparent,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                              Color(0xFF4CAF50)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Widget helper riutilizzabile per una riga statistica con icona, etichetta e valore.
  // Il valore viene mostrato in una badge colorata con bordo.
  Widget _buildStatRow(
      IconData icon, String label, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: color, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontSize: 16, color: Colors.white70),
            ),
          ),
          Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: color, width: 1.5),
            ),
            child: Text(
              value,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}