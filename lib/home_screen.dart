//import 'dart:io';

import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:path_provider/path_provider.dart';
//import 'package:productivity_app/counter_storage.dart';
import 'package:productivity_app/json_storage.dart';
//import 'package:productivity_app/models/card_plan.dart';
import 'package:productivity_app/models/plan.dart';
import 'package:productivity_app/pages/plans_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(
      {super.key, /*required this.storage,*/ required this.jsonStorage});

  //final CounterStorage storage;
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
  double _availTime = 60;
  int intAvailTime = 60;
  List<Plan> plans = [
    Plan(
        name: 'planA',
        description: 'plan A description',
        duration: 1,
        difficulty: 1),
    Plan(
        name: 'planB',
        description: 'plan B description',
        duration: 2,
        difficulty: 2)
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
            margin: const EdgeInsets.only(
                left: 7,
                top: 7,
                right: 7,
                bottom: 7), // Add margins around the icon button
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(69, 142, 236, 145),
              /*border: Border.all(
                  color: Colors.grey, width: 2), // Border around the icon
              borderRadius:
                  BorderRadius.circular(15),*/ // Rounded corners for the border
            ),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PlansPage(
                            jsonStorage: JsonStorage(),
                          )),
                ).then((value) => _loadPlans());
              },
              icon: const Icon(Icons.calendar_month),
            )),
        title: Text(
          _date,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
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
            Expanded(
              child: Scrollbar(
                thumbVisibility: true,
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  itemCount: plans.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                        leading: const Icon(Icons.event),
                        title: Text(plans[index].name),
                        subtitle: Text(plans[index].description),
                        trailing: SizedBox(
                            width: 70,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                  child: Text("${plans[index].duration} '"),
                                ),
                                const SizedBox(width: 8),
                                SizedBox(
                                  width: 40,
                                  child:
                                      Text("Dif: ${plans[index].difficulty}"),
                                ),
                              ],
                            )));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).colorScheme.onPrimary,
        child: SizedBox(
          height: 80,
          child: Column(
            children: [
              //const SizedBox(height: 10),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'How many minutes do you have available now?',
                style: TextStyle(
                  //fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Slider(
                      value: _availTime,
                      min: 15,
                      max: 240,
                      onChanged: (double newAvailTime) {
                        setState(() {
                          _availTime = newAvailTime;
                          intAvailTime = _availTime.toInt();
                        });
                      },
                      divisions: 15,
                      //label: "$_intAvailTime min",
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    child: Text('$intAvailTime min'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
