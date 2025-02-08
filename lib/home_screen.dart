import 'dart:io';

import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:productivity_app/counter_storage.dart';
import 'package:productivity_app/json_storage.dart';
import 'package:productivity_app/models/plan.dart';
import 'package:productivity_app/pages/plans_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(
      {super.key, required this.storage, required this.jsonStorage});

  final CounterStorage storage;
  final JsonStorage jsonStorage;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //int _counter = 0;
  Plan _plan = Plan(name: 'No Plan', description: 'No description');
  final String _date = DateFormat.yMMMEd().format(DateTime.now());

  @override
  void initState() {
    super.initState();
    /*widget.storage.readCounter().then((value) {
      setState(() {
        _counter = value;
      });
    });*/
    widget.jsonStorage.readJsonFile().then((value) {
      setState(() {
        _plan = Plan.fromJson(value);
      });
    });
  }

  /*Future<File> _incrementCounter() async {
    final appDocDir = await getApplicationDocumentsDirectory();
    final appDocPath = appDocDir.path;
    print('App Documents Directory: $appDocPath');
    setState(() {
      _counter++;
      /*_plan = Plan(
          name: 'nom nou',
          description:
              'Button tapped $_counter time${_counter == 1 ? '' : 's'}.');*/
    });

    // Write the variable as a string to the file.
    return widget.storage.writeCounter(_counter);
  }*/

  Future<Plan> updateCard(String name, String description) async {
    setState(() {
      _plan = Plan(name: name, description: description);
    });
    return widget.jsonStorage.writeJsonFile(_plan.name, _plan.description);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<ProfileScreen>(
                  builder: (context) => ProfileScreen(
                    appBar: AppBar(
                      title: const Text('User Profile'),
                    ),
                    //actions: [
                    //SignedOutAction((context) {
                    //Navigator.of(context).pop();
                    //})
                    //],
                    children: [
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.asset('assets/flutterfire_300x.png'),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              _date,
              style: Theme.of(context).textTheme.displaySmall,
            ),

            //Text('Button tapped $_counter time${_counter == 1 ? '' : 's'}.'),

            /*TextButton(
              onPressed: () async {
                final tempDir = await getTemporaryDirectory();
                final tempDirPath = tempDir.path;
                print(tempDirPath);
              },
              child: const Text('Temp file dir here'),
            ),*/
            //Image.asset('assets/dash.png'),
            const Text('Available plans:'),
            Row(
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.only(
                        left: 10,
                        top: 10,
                        right: 0,
                        bottom: 10), // Add margins around the icon button
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey,
                          width: 2), // Border around the icon
                      borderRadius: BorderRadius.circular(
                          12), // Rounded corners for the border
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PlansPage()),
                        );
                      },
                      icon: const Icon(Icons.add),
                    )),
                Expanded(
                  child: CardPlan(
                    title: _plan.name,
                    description: _plan.description,
                  ),
                ),
              ],
            ),

            const SignOutButton(),
          ],
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        //onPressed: _incrementCounter,
        onPressed: ,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),*/
    );
  }
}

class CardPlan extends StatelessWidget {
  final String title;
  final String description;

  CardPlan({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(16),
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          ListTile(
            leading: const Icon(Icons.event),
            title: Text(title),
            subtitle: Text(description),
          ),
          const SizedBox(width: 8),
        ]),
      ),
    );
  }
}

class NewCard extends StatefulWidget {
  final Function(String name, String description) function;
  const NewCard({super.key, required this.function});

  @override
  State<NewCard> createState() => _NewCardState();
}

class _NewCardState extends State<NewCard> {
  final myTextFieldController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myTextFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(16),
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          ListTile(
            leading: const Icon(Icons.event),
            title: TextField(
              controller: myTextFieldController,
              decoration: const InputDecoration(
                //border: OutlineInputBorder(),
                hintText: 'Enter a title',
              ),
            ),
            subtitle: const TextField(
              decoration: InputDecoration(
                //border: OutlineInputBorder(),
                hintText: 'Enter a description',
              ),
            ),
            //trailing: const Icon(Icons.check),
            trailing: FloatingActionButton(
              onPressed: //() {
                  //_updateCard;
                  /*showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(myTextFieldController.text),
                    );
                  },
                );*/
                  //}
                  widget.function(myTextFieldController.text, 'description'),
              tooltip: 'Create plan!',
              child: const Icon(Icons.check),
            ),
          ),
          const SizedBox(width: 8),
        ]),
      ),
    );
  }
}

/*class CardPlan2 extends StatelessWidget {
  final String title;
  final String description;

  // Constructor accepting title and description arguments
  CardPlan2({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4, // adds shadow to the card
      margin: EdgeInsets.all(16), // adds margin around the card
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title of the card
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
                height: 8), // Adds space between title and description
            // Description of the card
            Text(
              description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/
