import 'package:flutter/material.dart';
import 'package:productivity_app/json_storage.dart';
import 'package:productivity_app/models/plan.dart';
import 'package:productivity_app/pages/plan_crud_page.dart';

class PlansPage extends StatefulWidget {
  const PlansPage({super.key, required this.jsonStorage});

  final JsonStorage jsonStorage;

  @override
  State<PlansPage> createState() => _PlansPageState();
}

class _PlansPageState extends State<PlansPage> {
  List<Plan> allPlans = [
    Plan(name: 'planX', description: 'plan X description', duration: 11),
    Plan(name: 'planY', description: 'plan Y description', duration: 22)
  ];

  @override
  void initState() {
    super.initState();
    /*widget.jsonStorage.readJsonFile().then((value) {
      setState(() {
        allPlans = value.map((value) => Plan.fromJson(value)).toList();
      });
    });*/
    _loadPlans();
  }

  void _loadPlans() async {
    List<Plan> loadedPlans = await widget.jsonStorage.loadPlans();
    setState(() {
      allPlans = loadedPlans;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plans Available'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'You are on the Plans Page!',
              style: TextStyle(fontSize: 24),
            ),
            ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              itemCount: allPlans.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: const Icon(Icons.event),
                  title: Text(allPlans[index].name),
                  subtitle: Text(allPlans[index].description),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CRUDPlanPage()),
          );
        },
      ),
    );
  }
}
