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
    final currentUser = Injector.appInstance.get<SupabaseClient>().auth.user();

    final todoWidgets = todos
        .map((todo) => ListTile(
              leading: Checkbox(
                  value: todo.isComplete,
                  onChanged: todo.userId == currentUser.id
                      ? (isComplete) async {
                          await updatedTodo(todo, isComplete);
                        }
                      : null),
              trailing: todo.userId == currentUser.id
                  ? IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => deleteTodo(todo.id),
                    )
                  : null,
              title: Text(todo.task),
            ))
        .toList();
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 500,
            child: ListView(
              children: todos
                  .map((todo) => ListTile(
                      leading: Checkbox(
                          value: todo.isComplete,
                          onChanged: (isComplete) async {
                            await updatedTodo(todo, isComplete);
                          }),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => deleteTodo(todo.id),
                      ),
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
          SizedBox(
            width: 20,
          ),
          TextButton(
            onPressed: () async {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => DataSaw()),
                  (route) => false);
            },
            child: Text('Actualizar'),
          )
        ],
      ),
    ));
  }

  Future deleteTodo(int todoId) async {
    await Injector.appInstance
        .get<SupabaseClient>()
        .from('todos')
        .delete()
        .eq('id', todoId)
        .execute();
  }

  Future updatedTodo(Todo updatedTodo, bool isComplete) async {
    await Injector.appInstance
        .get<SupabaseClient>()
        .from('todos')
        .update({'is_complete': isComplete})
        .eq('id', updatedTodo.id)
        .execute();
    setState(() {
      updatedTodo.isComplete = isComplete;
    });
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
        .on(SupabaseEventTypes.delete, (payload) {
      final deleteId = payload.oldRecord['id'];
      setState(() {
        todos = todos.where((t) => t.id != deleteId).toList();
      });
    }).on(SupabaseEventTypes.update, (payload) {
      final updatedTodo = Todo.fromJSON(payload.newRecord);
      final todo =
          todos.firstWhere((t) => t.id == updatedTodo, orElse: () => null);
      if (todo == null) {
        setState(() {
          todos = [todo, ...todos];
        });
      } else {
        todo.isComplete = updatedTodo.isComplete;
      }
    }).on(SupabaseEventTypes.insert, (payload) {
      final todo = Todo.fromJSON(payload.newRecord);
      setState(() {
        todos = [todo, ...todos];
      });
    }).subscribe();
  }
}
