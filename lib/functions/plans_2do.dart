import 'package:productivity_app/models/plan.dart';

List<Plan> createPlanToDo(int availTime, List<Plan> availPlans) {
  List<Plan> plansToDo;
  int maxDifficulty = 0;
  int maxDiffIndex = 0;

  for (int i = 1; i <= availPlans.length; i++) {
    if (availPlans[i].duration < availTime) {
      if (availPlans[i].difficulty > maxDifficulty) {
        maxDiffIndex = i;
      }
    }
  }
}
