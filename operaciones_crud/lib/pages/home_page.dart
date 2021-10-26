import 'package:flutter/material.dart';
import 'package:operaciones_crud/supabasehandler.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SupabaseHandler supabasehandler = SupabaseHandler();

  get children => null;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String newValue;
    return Scaffold(
        appBar: AppBar(
          title: const Text("SUPABASE CRUD"),
        ),
        body: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData == null &&
                snapshot.connectionState == ConnectionState.none) {}
            return ListView.builder(
                itemCount:
                    snapshot.data.length == null ? 0 : snapshot.data.length,
                itemBuilder: (context, index) {
                  return Container(
                      height: 150,
                      color: snapshot.data[index]['status']
                          ? Colors.white
                          : Colors.red,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: 200,
                                child: Center(
                                  child: Text(snapshot.data[index]['task']),
                                )),
                            IconButton(
                                onPressed: () {
                                  supabasehandler.updateData(
                                      snapshot.data[index]['id'], true);
                                },
                                icon: Icon(Icons.done)),
                            IconButton(
                                onPressed: () {
                                  supabasehandler
                                      .deleteData(snapshot.data[index]['id']);
                                  setState(() {});
                                },
                                icon: Icon(Icons.delete)),
                          ]));
                });
          },
          future: supabasehandler.readData(),
        ),
        floatingActionButton: Container(
          width: MediaQuery.of(context).size.width*0.9,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child: TextField(
                onChanged: (value) {
                  newValue = value;
                },
              )),
              FloatingActionButton(
                  onPressed: () {
                    supabasehandler.addData(newValue, false);
                    setState(() {});
                  },
                  child: Icon(Icons.add)),
              FloatingActionButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Icon(Icons.refresh))
            ],
          ),
        ));
  }
}
