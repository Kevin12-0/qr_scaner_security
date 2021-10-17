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
  TextEditingController newTaskName;

  void initState() {
    super.initState();

    newTaskName = TextEditingController();
    setupTodosSusciptions();

    Future.microtask(() async {
      final _todos = await getInitialTodos();
      setState(() {
        todos = _todos;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = Injector.appInstance.get<SupabaseClient>().auth.user();

    // ignore: unused_local_variable
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
        appBar: AppBar(
          title: Text(currentUser.email),
          actions: [
            ElevatedButton(
              onPressed: () async {
                await Injector.appInstance.get<SupabaseClient>().auth.signOut();

                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => SplashPage()),
                    (route) => false);
              },
              child: Text('Cerrar Sesión'),
            )
          ],
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  controller: newTaskName,
                  onEditingComplete: addTask,
                  decoration: InputDecoration(
                    helperText: 'Task',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.add),
                      onPressed: addTask,
                    ),
                  )),
            ),
          ],
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
          // ignore: unrelated_type_equality_checks
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

  Future addTask() async {
    final client = Injector.appInstance.get<SupabaseClient>();
    final currentUser = client.auth.user();

    final newTodo =
        Todo(task: newTaskName.text, userId: currentUser.id, isComplete: false);

    Injector.appInstance
        .get<SupabaseClient>()
        .from('todos')
        .insert(newTodo.toJSON())
        .execute();

    setState(() {
      newTaskName.text = '';
    });
  }
}
