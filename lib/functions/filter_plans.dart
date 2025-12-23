import 'package:productivity_app/models/plan.dart';

List<Plan> finalPlans = [
  /*Plan(
      name: 'planC',
      description: 'plan C description',
      duration: 1,
      difficulty: 1),
  Plan(
      name: 'planD',
      description: 'plan D description',
      duration: 2,
      difficulty: 2)*/
];

List<Plan> filterPlans(List<Plan> loadedPlans, int availTime) {
  finalPlans = [];
  print(loadedPlans.length);
  //finalPlans = loadedPlans;
  for (int i = 0; i < loadedPlans.length; i++) {
    //print(loadedPlans[i].name);
    if (loadedPlans[i].duration <= availTime) {
      finalPlans.add(loadedPlans[i]);
    }
  }

  return finalPlans;
}
