import 'package:flutter/material.dart';
import 'package:sample_project/components/header_widget.dart';
import 'package:sample_project/task.dart';

void main() {
  runApp(SampleProject());
}

class SampleProject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> task = [];

  String title;
  String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Container(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Text('ADD ITEM'),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      onChanged: (value) {
                        title = value;
                      },
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: 'Title',
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      onChanged: (value) {
                        text = value;
                      },
                      maxLines: 7,
                      minLines: 5,
                      decoration: InputDecoration(
                        labelText: 'Text',
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: FlatButton(
                        color: Colors.blue,
                        onPressed: () {
                          setState(() {
                            task.add(Task(title: title, text: text));
                          });
                          Navigator.pop(context);
                        },
                        child: Text(
                          'SAVE',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
      backgroundColor: Color(0xFF4891FF),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: ListView.builder(
                itemCount: task.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5.0,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListTile(
                        title: Text(task[index].title),
                        subtitle: Text(task[index].text),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            setState(() {
                              task.removeAt(index);
                            });
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
