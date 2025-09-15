import 'package:flutter/material.dart';
import 'package:productivity_app/models/plan.dart';

class ModPlanPage extends StatefulWidget {
  const ModPlanPage({super.key, required index, required this.plan});

  final Plan plan;

  @override
  State<ModPlanPage> createState() => _ModPlanPageState();
}

class _ModPlanPageState extends State<ModPlanPage> {
  //final GlobalKey<CRUDFormState> _formKey = GlobalKey<CRUDFormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit your plan here'),
      ),
      body: Center(
        child: Column(
          children: [
            /*Text(
              'You are on the Page to edit or create a plan!',
              style: TextStyle(fontSize: 24),
            ),*/
            CRUDForm(plan: widget.plan),
          ],
        ),
      ),
    );
  }
}

class CRUDForm extends StatefulWidget {
  const CRUDForm({super.key, required this.plan});
  final Plan plan;

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
  final TextEditingController _difficultyController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _titleController.text = widget.plan.name;
    _descriptionController.text = widget.plan.description;
    _durationController.text = widget.plan.duration.toString();
    _difficultyController.text = widget.plan.difficulty.toString();
  }

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
              /*validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              onSaved: (value) {
                //_formTitle = value!;
              },*/
            ),
            TextFormField(
              controller: _descriptionController,
              //maxLength: 50,
              decoration: const InputDecoration(label: Text('Desciption')),
              // The validator receives the text that the user has entered.
              /*validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              onSaved: (value) {
                //_formDescription = value!;
              },*/
            ),
            /*DropdownButtonFormField(
              value: _formDuration,
              decoration: const InputDecoration(
                label: Text('Duration'),
              ),
              items: ['15min', '30min', '1hour']
                  .map((option) => DropdownMenuItem(
                        value: option,
                        child: Text(option),
                      ))
                  .toList(),
              onChanged: (value) {
                _formDuration = value!;
              },
            ),*/
            TextFormField(
              controller: _durationController,
              decoration: const InputDecoration(label: Text('Duration')),
            ),
            TextFormField(
              controller: _difficultyController,
              decoration: const InputDecoration(label: Text('Difficulty')),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {
                  //if (_formKey.currentState!.validate()) {
                  //  _formKey.currentState!.save();
                  Navigator.pop(
                    context,
                    Plan(
                      name: _titleController.text.trim(),
                      description: _descriptionController.text.trim(),
                      duration: int.parse(_durationController.text),
                      difficulty: int.parse(_difficultyController.text),
                    ),
                  );
                  //}
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
