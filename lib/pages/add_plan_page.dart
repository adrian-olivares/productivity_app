import 'package:flutter/material.dart';
import 'package:productivity_app/models/plan.dart';

class AddPlanPage extends StatefulWidget {
  const AddPlanPage({super.key});

  @override
  State<AddPlanPage> createState() => _AddPlanPageState();
}

class _AddPlanPageState extends State<AddPlanPage> {
  //final GlobalKey<CRUDFormState> _formKey = GlobalKey<CRUDFormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Plan Page'),
      ),
      body: const Center(
        child: Column(
          children: [
            /*Text(
              'You are on the Page to edit or create a plan!',
              style: TextStyle(fontSize: 24),
            ),*/
            CRUDForm(),
          ],
        ),
      ),
    );
  }
}

class CRUDForm extends StatefulWidget {
  const CRUDForm({super.key});

  @override
  CRUDFormState createState() {
    return CRUDFormState();
  }
}

class CRUDFormState extends State<CRUDForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  //final TextEditingController _difficultyController = TextEditingController();
  double _difficultyValue = 0;

  /*@override
  void initState() {
    super.initState();

    _titleController.text = ;
    _descriptionController.text = ;
    _durationController.text = ;
    _difficultyController.text = ;
  }*/

  bool validateForm() {
    if (_formKey.currentState?.validate() ?? false) {
      return true; // Form is valid
    }
    return false; // Form is invalid
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _titleController,
              maxLength: 50,
              decoration:
                  const InputDecoration(label: Text('Title of the plan')),
              // The validator receives the text that the user has entered.
            ),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(label: Text('Description')),
              // The validator receives the text that the user has entered.
            ),
            TextFormField(
              controller: _durationController,
              decoration:
                  const InputDecoration(label: Text('How many minutes?')),
              // The validator receives the text that the user has entered.
            ),
            const SizedBox(height: 16),
            const Text('Difficulty:'),
            const SizedBox(height: 16),
            /*LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              double spacing = constraints.maxWidth / 4;
              SizedBox(
                width: spacing,
                child: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.mood),
                      Icon(Icons.mood),
                      Icon(Icons.mood),
                      Icon(Icons.mood),
                      Icon(Icons.mood),
                    ],
                  ),
                ),
              );
            }),*/
            Container(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.sentiment_very_dissatisfied),
                  Icon(Icons.sentiment_dissatisfied),
                  Icon(Icons.sentiment_neutral),
                  Icon(Icons.sentiment_satisfied),
                  Icon(Icons.sentiment_very_satisfied),
                ],
              ),
            ),
            Slider(
              value: _difficultyValue,
              min: -2,
              max: 2,
              onChanged: (double newDifficultyValue) {
                setState(() {
                  _difficultyValue = newDifficultyValue;
                });
              },
              divisions: 4,
              //label: "$_difficultyValue",
            ),

            /*TextFormField(
              controller: _difficultyController,
              decoration: const InputDecoration(label: Text('Difficulty')),
              // The validator receives the text that the user has entered.
            ),*/
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.pop(
                      context,
                      Plan(
                        name: _titleController.text,
                        description: _descriptionController.text,
                        duration: int.parse(_durationController.text),
                        difficulty: _difficultyValue.toInt(),
                        //difficulty: int.parse(_difficultyController.text),
                      ),
                    );
                  }
                },
                child: const Icon(Icons.check),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
