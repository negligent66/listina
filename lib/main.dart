import 'package:flutter/material.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dragon Ball TO DO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFFFF8C00),
        scaffoldBackgroundColor: const Color(0xFF1A1A2E),
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFFFF8C00),
          secondary: const Color(0xFFFFD700),
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

class TodoList {
  String name;
  List<TodoItem> items;

  TodoList({required this.name, List<TodoItem>? items})
      : items = items ?? [];

  // Easter egg: controlla se il nome contiene riferimenti a Dragon Ball
  Map<String, dynamic>? getThemeColors() {
    final lowerName = name.toLowerCase();

    // IMPORTANTE: Controlli più specifici PRIMA di quelli generici!

    // Goku Black/Zamasu - Rosa/Nero (PRIMA di Goku normale!)
    if (lowerName.contains('goku black') || lowerName.contains('black') || lowerName.contains('zamasu') || lowerName.contains('rose')) {
      return {
        'primary': const Color(0xFFFF1493),
        'secondary': const Color(0xFF000000),
        'accent': const Color(0xFFFF69B4),
      };
    }

    // Ultra Instinct - Argento/Bianco (PRIMA di UI generici!)
    if (lowerName.contains('ultra instinct') || lowerName.contains('migatte')) {
      return {
        'primary': const Color(0xFFC0C0C0),
        'secondary': const Color(0xFFFFFFFF),
        'accent': const Color(0xFFE8E8E8),
      };
    }

    // Cooler Final Form - Rosso e Bianco
    if (lowerName.contains('cooler') || lowerName.contains('final form')) {
      return {
        'primary': const Color(0xFF8B0000),
        'secondary': const Color(0xFFFFFFFF),
        'accent': const Color(0xFFDC143C),
      };
    }

    // Goku Super Saiyan - Giallo/Oro (ORA è sicuro controllare "goku")
    if (lowerName.contains('goku') || lowerName.contains('super saiyan') || lowerName.contains('ssj')) {
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

    // Piccolo - Verde
    if (lowerName.contains('piccolo') || lowerName.contains('namek')) {
      return {
        'primary': const Color(0xFF228B22),
        'secondary': const Color(0xFF32CD32),
        'accent': const Color(0xFF00FF00),
      };
    }

    // Freezer/Frieza - Viola e Bianco
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

    return null; // Nessun easter egg trovato
  }
}

class TodoItem {
  String title;
  bool isCompleted;

  TodoItem({required this.title, this.isCompleted = false});

  // Easter egg: controlla se il titolo contiene riferimenti a Dragon Ball
  Map<String, dynamic>? getThemeColors() {
    final lowerTitle = title.toLowerCase();

    // IMPORTANTE: Controlli più specifici PRIMA di quelli generici!

    // Goku Black/Zamasu - Rosa/Nero (PRIMA di Goku normale!)
    if (lowerTitle.contains('goku black') || lowerTitle.contains('black') || lowerTitle.contains('zamasu') || lowerTitle.contains('rose')) {
      return {
        'primary': const Color(0xFFFF1493),
        'secondary': const Color(0xFF000000),
        'accent': const Color(0xFFFF69B4),
      };
    }

    // Ultra Instinct - Argento/Bianco (PRIMA di UI generici!)
    if (lowerTitle.contains('ultra instinct') || lowerTitle.contains('migatte')) {
      return {
        'primary': const Color(0xFFC0C0C0),
        'secondary': const Color(0xFFFFFFFF),
        'accent': const Color(0xFFE8E8E8),
      };
    }

    // Cooler Final Form - Rosso e Bianco
    if (lowerTitle.contains('cooler') || lowerTitle.contains('final form')) {
      return {
        'primary': const Color(0xFF8B0000),
        'secondary': const Color(0xFFFFFFFF),
        'accent': const Color(0xFFDC143C),
      };
    }

    // Goku Super Saiyan - Giallo/Oro (ORA è sicuro controllare "goku")
    if (lowerTitle.contains('goku') || lowerTitle.contains('super saiyan') || lowerTitle.contains('ssj')) {
      return {
        'primary': const Color(0xFFFFD700),
        'secondary': const Color(0xFFFFA500),
        'accent': const Color(0xFFFFFF00),
      };
    }

    // Vegeta - Blu navy
    if (lowerTitle.contains('vegeta')) {
      return {
        'primary': const Color(0xFF000080),
        'secondary': const Color(0xFF4169E1),
        'accent': const Color(0xFF1E90FF),
      };
    }

    // Piccolo - Verde
    if (lowerTitle.contains('piccolo') || lowerTitle.contains('namek')) {
      return {
        'primary': const Color(0xFF228B22),
        'secondary': const Color(0xFF32CD32),
        'accent': const Color(0xFF00FF00),
      };
    }

    // Freezer/Frieza - Viola e Bianco
    if (lowerTitle.contains('freezer') || lowerTitle.contains('frieza')) {
      return {
        'primary': const Color(0xFF8B008B),
        'secondary': const Color(0xFFFFFFFF),
        'accent': const Color(0xFFDA70D6),
      };
    }

    // Cell - Verde acido
    if (lowerTitle.contains('cell')) {
      return {
        'primary': const Color(0xFF7FFF00),
        'secondary': const Color(0xFF00FF7F),
        'accent': const Color(0xFF39FF14),
      };
    }

    // Majin Buu - Rosa
    if (lowerTitle.contains('buu') || lowerTitle.contains('majin')) {
      return {
        'primary': const Color(0xFFFF69B4),
        'secondary': const Color(0xFFFFB6C1),
        'accent': const Color(0xFFFF1493),
      };
    }

    // Broly - Verde lime
    if (lowerTitle.contains('broly')) {
      return {
        'primary': const Color(0xFF00FF00),
        'secondary': const Color(0xFF7FFF00),
        'accent': const Color(0xFFADFF2F),
      };
    }

    // Gohan - Rosso/Arancione
    if (lowerTitle.contains('gohan')) {
      return {
        'primary': const Color(0xFFFF4500),
        'secondary': const Color(0xFFFF6347),
        'accent': const Color(0xFFFF7F50),
      };
    }

    // Trunks - Blu chiaro/Lavanda
    if (lowerTitle.contains('trunks')) {
      return {
        'primary': const Color(0xFF87CEEB),
        'secondary': const Color(0xFFE6E6FA),
        'accent': const Color(0xFF6495ED),
      };
    }

    // Hit - Viola scuro
    if (lowerTitle.contains('hit')) {
      return {
        'primary': const Color(0xFF4B0082),
        'secondary': const Color(0xFF9370DB),
        'accent': const Color(0xFF8A2BE2),
      };
    }

    // Jiren - Grigio/Rosso
    if (lowerTitle.contains('jiren')) {
      return {
        'primary': const Color(0xFF808080),
        'secondary': const Color(0xFFFF0000),
        'accent': const Color(0xFFC0C0C0),
      };
    }

    // Beerus - Viola
    if (lowerTitle.contains('beerus')) {
      return {
        'primary': const Color(0xFF9932CC),
        'secondary': const Color(0xFFBA55D3),
        'accent': const Color(0xFFDA70D6),
      };
    }

    // Whis - Blu celeste
    if (lowerTitle.contains('whis')) {
      return {
        'primary': const Color(0xFF00BFFF),
        'secondary': const Color(0xFF87CEEB),
        'accent': const Color(0xFF1E90FF),
      };
    }

    return null; // Nessun easter egg trovato
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<TodoList> _todoLists = [
    TodoList(name: '🐉 Lista Principale'),
  ];
  int _selectedListIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      ListScreen(
        todoLists: _todoLists,
        selectedListIndex: _selectedListIndex,
        onListChanged: (index) {
          setState(() {
            _selectedListIndex = index;
          });
        },
        onAddList: (name) {
          setState(() {
            _todoLists.add(TodoList(name: name));
          });
        },
        onDeleteList: (index) {
          setState(() {
            if (_todoLists.length > 1) {
              _todoLists.removeAt(index);
              if (_selectedListIndex >= _todoLists.length) {
                _selectedListIndex = _todoLists.length - 1;
              }
            }
          });
        },
        onRenameList: (index, newName) {
          setState(() {
            _todoLists[index].name = newName;
          });
        },
        onAddItem: (item) {
          setState(() {
            _todoLists[_selectedListIndex].items.add(item);
          });
        },
        onToggleItem: (index) {
          setState(() {
            _todoLists[_selectedListIndex].items[index].isCompleted =
            !_todoLists[_selectedListIndex].items[index].isCompleted;
          });
        },
        onDeleteItem: (index) {
          setState(() {
            _todoLists[_selectedListIndex].items.removeAt(index);
          });
        },
      ),
      StatsScreen(todoLists: _todoLists),
    ];

    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFF16213E),
              const Color(0xFF0F3460),
            ],
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
            setState(() {
              _currentIndex = index;
            });
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
  final TextEditingController _controller = TextEditingController();

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
                '⭐ Nuova Missione',
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
                  hintStyle: TextStyle(color: Colors.white54),
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
                    child: const Text('Annulla', style: TextStyle(color: Colors.white70)),
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
                    child: const Text('Crea', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

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
                '✏️ Rinomina Lista',
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
                  hintStyle: TextStyle(color: Colors.white54),
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
                    child: const Text('Annulla', style: TextStyle(color: Colors.white70)),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (controller.text.isNotEmpty) {
                        widget.onRenameList(widget.selectedListIndex, controller.text);
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
                    child: const Text('Salva', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addTodoItem() {
    if (_controller.text.isNotEmpty) {
      widget.onAddItem(TodoItem(title: _controller.text));
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentList = widget.todoLists[widget.selectedListIndex];
    final themeColors = currentList.getThemeColors();
    final primaryColor = themeColors?['primary'] ?? const Color(0xFFFF8C00);
    final secondaryColor = themeColors?['secondary'] ?? const Color(0xFFFFD700);
    final accentColor = themeColors?['accent'] ?? const Color(0xFFFF8C00);

    return Scaffold(
      appBar: AppBar(
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
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: DropdownButton<int>(
                  value: widget.selectedListIndex,
                  underline: Container(),
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
                    if (value != null) {
                      widget.onListChanged(value);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
        actions: [
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
                            const Icon(Icons.warning_amber, color: Colors.red, size: 50),
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
                                  child: const Text('Annulla', style: TextStyle(color: Colors.white70)),
                                ),
                                const SizedBox(width: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    widget.onDeleteList(widget.selectedListIndex);
                                    Navigator.pop(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  child: const Text('Elimina', style: TextStyle(fontWeight: FontWeight.bold)),
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
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  primaryColor.withOpacity(0.2),
                  Colors.transparent,
                ],
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
                        hintText: '⚡ Inserisci nuova sfida...',
                        hintStyle: const TextStyle(color: Colors.white54),
                        filled: true,
                        fillColor: const Color(0xFF16213E),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: primaryColor, width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: primaryColor, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: secondaryColor, width: 2),
                        ),
                      ),
                      onSubmitted: (_) => _addTodoItem(),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [primaryColor, secondaryColor],
                    ),
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
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.add_task, color: Colors.white),
                        SizedBox(width: 8),
                        Text('AGGIUNGI', style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: currentList.items.isEmpty
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
                    child: Icon(
                      Icons.military_tech,
                      size: 80,
                      color: accentColor,
                    ),
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
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white54,
                    ),
                  ),
                ],
              ),
            )
                : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              itemCount: currentList.items.length,
              itemBuilder: (context, index) {
                final item = currentList.items[index];
                final itemColors = item.getThemeColors();
                final itemPrimary = itemColors?['primary'] ?? primaryColor;
                final itemAccent = itemColors?['accent'] ?? accentColor;

                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
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
                        color: item.isCompleted
                            ? const Color(0xFF4CAF50)
                            : itemPrimary,
                        width: 2,
                      ),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      leading: Transform.scale(
                        scale: 1.3,
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
                        icon: const Icon(Icons.delete_forever, color: Colors.red),
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
    _controller.dispose();
    super.dispose();
  }
}

class StatsScreen extends StatelessWidget {
  final List<TodoList> todoLists;

  const StatsScreen({Key? key, required this.todoLists}) : super(key: key);

  Map<String, int> _calculateStats(TodoList list) {
    int total = list.items.length;
    int completed = list.items.where((item) => item.isCompleted).length;
    int pending = total - completed;
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
        title: Row(
          children: [
            Icon(Icons.emoji_events, color: Colors.white),
            SizedBox(width: 10),
            Text('Power Level', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: todoLists.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            int totalAll = 0;
            int completedAll = 0;

            for (var list in todoLists) {
              totalAll += list.items.length;
              completedAll += list.items.where((item) => item.isCompleted).length;
            }

            int pendingAll = totalAll - completedAll;
            int efficiencyAll = totalAll > 0 ? ((completedAll / totalAll) * 100).round() : 0;

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
                      Row(
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
                      _buildStatRow(Icons.stars, 'Missioni Totali', totalAll.toString(), Colors.white),
                      _buildStatRow(Icons.check_circle, 'Completate', completedAll.toString(), const Color(0xFF4CAF50)),
                      _buildStatRow(Icons.pending_actions, 'In Corso', pendingAll.toString(), const Color(0xFFFFEB3B)),
                      _buildStatRow(Icons.flash_on, 'Power Level', '$efficiencyAll%', const Color(0xFFFFD700)),
                      const SizedBox(height: 16),
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
                                    colors: [Color(0xFF4CAF50), Color(0xFF8BC34A)],
                                  ),
                                ),
                                child: FractionallySizedBox(
                                  widthFactor: totalAll > 0 ? completedAll / totalAll : 0,
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

          final list = todoLists[index - 1];
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
                side: const BorderSide(color: Color(0xFFFF8C00), width: 2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.folder_special, color: Color(0xFFFFD700), size: 24),
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
                    const Divider(color: Color(0xFFFF8C00), thickness: 2, height: 24),
                    _buildStatRow(Icons.stars, 'Totali', stats['total'].toString(), Colors.white70),
                    _buildStatRow(Icons.check_circle, 'Completate', stats['completed'].toString(), const Color(0xFF4CAF50)),
                    _buildStatRow(Icons.pending_actions, 'Da Fare', stats['pending'].toString(), const Color(0xFFFFEB3B)),
                    _buildStatRow(Icons.flash_on, 'Potenza', '${stats['efficiency']}%', const Color(0xFFFFD700)),
                    const SizedBox(height: 12),
                    Container(
                      height: 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xFF0F3460),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: LinearProgressIndicator(
                          value: stats['total']! > 0 ? stats['completed']! / stats['total']! : 0,
                          backgroundColor: Colors.transparent,
                          valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF4CAF50)),
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

  Widget _buildStatRow(IconData icon, String label, String value, Color color) {
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
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
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