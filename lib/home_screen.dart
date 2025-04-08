//import 'dart:io';

import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:path_provider/path_provider.dart';
import 'package:productivity_app/counter_storage.dart';
import 'package:productivity_app/json_storage.dart';
//import 'package:productivity_app/models/card_plan.dart';
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
  /*Plan _plan = Plan(
    name: 'Meditation',
    description: 'Try meditating for 15 minutes',
    duration: 15,
  );*/

  List<Plan> plans = [
    Plan(name: 'planA', description: 'plan A description', duration: 1),
    Plan(name: 'planB', description: 'plan B description', duration: 2)
  ];

  final String _date = DateFormat.yMMMEd().format(DateTime.now());

  @override
  void initState() {
    super.initState();
    /*widget.storage.readCounter().then((value) {
      setState(() {
        _counter = value;
      });
    });*/
    /*widget.jsonStorage.readJsonFile().then((value) {
      setState(() {
        plans = value.map((value) => Plan.fromJson(value)).toList();
        //_plan = Plan.fromJson(value);
        //_plan = plans[1];
        //widget.jsonStorage.writeJsonFile(_plan.name, _plan.description, _plan.duration);
        for (var plan in plans) {
          print(plan.toJson());
        }
        //print(_plan.toJson());
      });
    });*/
    _loadPlans();
    //widget.jsonStorage.writePlans(plans);
  }

  void _loadPlans() async {
    List<Plan> loadedPlans = await widget.jsonStorage.loadPlans();
    setState(() {
      plans = loadedPlans;
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

  /*Future<Plan> updateCard(String name, String description, int duration) async {
    setState(() {
      _plan = Plan(name: name, description: description);
    });
    return widget.jsonStorage
        .writeJsonFile(_plan.name, _plan.description, _plan.duration);
  }*/

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
            //const Text('Active plans:'),

            ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              itemCount: plans.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: const Icon(Icons.event),
                  title: Text(plans[index].name),
                  subtitle: Text(plans[index].description),
                );
              },
            ),
            Container(
                margin: const EdgeInsets.only(
                    left: 10,
                    top: 10,
                    right: 0,
                    bottom: 10), // Add margins around the icon button
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey, width: 2), // Border around the icon
                  borderRadius: BorderRadius.circular(
                      12), // Rounded corners for the border
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PlansPage(
                                jsonStorage: JsonStorage(),
                              )),
                    );
                  },
                  icon: const Icon(Icons.calendar_month),
                )),
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
