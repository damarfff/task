import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do List',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ToDoList(),
    );
  }
}

class ToDoList extends StatefulWidget {


  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  List <String> tasks = [];

  void addTask(String task){
    setState(() {
      tasks.add(task);
    });
  }

  void removeTask(int index){
    setState(() {
      tasks.removeAt(index);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do List"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(16.0),
            child: TextField(
              onSubmitted: (text){
                addTask(text);
              },
              decoration: InputDecoration(labelText: "Tambah Tugas Baru"),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index){
                return ListTile(
                  title: Text(tasks[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      removeTask (index);
                    },
                  ),
                );
              },
            ),
          )
        ],
      )
    );
  }
}
