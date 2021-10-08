import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:supabase/supabase.dart';
import 'splash_page.dart';
import 'package:scannercartus/models/todo.dart';

class DataSaw extends StatefulWidget {
  @override
  _DataSawState createState() => _DataSawState();
}

class _DataSawState extends State<DataSaw> {
  List<Todo> todos = [];
  RealtimeSubscription todosSubscription;
  void initState() {
    super.initState();
    Future.microtask(() async {
      final _todos = await getInitialTodos();
      setState(() {
        todos = _todos;
      });
      setupTodosSusciptions();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 500,
            child: ListView(
              children: todos
                  .map((todo) => ListTile(
                      leading:
                          Icon(todo.isComplete ? Icons.check : Icons.check_box),
                      title: Text(todo.task)))
                  .toList(),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await Injector.appInstance.get<SupabaseClient>().auth.signOut();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => SplashPage()),
                  (route) => false);
            },
            child: Text('Cerrar Sesión'),
          ),
        ],
      ),
    ));
  }

  Future<List<Todo>> getInitialTodos() async {
    final response = await Injector.appInstance
        .get<SupabaseClient>()
        .from('todos')
        .select()
        .order('inserted_at', ascending: true)
        .execute();

    final datalist = response.data as List;
    return datalist.map((map) => Todo.fromJSON(map)).toList();
  }

  void setupTodosSusciptions() {
    todosSubscription = Injector.appInstance
        .get<SupabaseClient>()
        .from('todos')
        .on(SupabaseEventTypes.update, (payload) {})
        .on(SupabaseEventTypes.insert, (payload) {
      final todo = Todo.fromJSON(payload.newRecord);
      setState(() {
        todos = [todo, ...todos];
      });
    }).subscribe();
  }
}