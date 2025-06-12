import 'package:flutter/material.dart';
import 'package:productivity_app/json_storage.dart';
import 'package:productivity_app/models/plan.dart';
import 'package:productivity_app/pages/add_plan_page.dart';
import 'package:productivity_app/pages/mod_plan_page.dart';

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
    _loadPlans();
  }

  void _loadPlans() async {
    List<Plan> loadedPlans = await widget.jsonStorage.loadPlans();
    setState(() {
      allPlans = loadedPlans;
    });
  }

  void _navigateToAddPlanPage() async {
    Plan newPlan = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddPlanPage()),
    );

    setState(() {
      allPlans.add(newPlan);
      widget.jsonStorage.writePlans(allPlans);
      print(newPlan.name);
      print(newPlan.description);
      print(newPlan.duration);
    });
  }

  void _navigateToModPlanPage(int index, Plan plan) async {
    Plan modedPlan = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ModPlanPage(index: index, plan: plan)),
    );

    setState(() {
      allPlans[index] = modedPlan;
      widget.jsonStorage.writePlans(allPlans);
      print(modedPlan.name);
      print(modedPlan.description);
      print(modedPlan.duration);
    });
  }

  void _deletePlan(int i) {
    setState(() {
      allPlans.removeAt(i);
      widget.jsonStorage.writePlans(allPlans);
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
                  onTap: () {
                    //print('tapped on the item $index');
                    _navigateToModPlanPage(index, allPlans[index]);
                  },
                  leading: const Icon(Icons.event),
                  title: Text(allPlans[index].name),
                  subtitle: Text(allPlans[index].description),
                  trailing: IconButton(
                    onPressed: () {
                      _deletePlan(index);
                    },
                    icon: const Icon(Icons.delete),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddPlanPage,
        child: const Icon(Icons.add),
      ),
    );
  }
}
