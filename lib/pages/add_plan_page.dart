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
        title: const Text('CRUD Plan Page'),
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

  String _formTitle = '';
  String _formDescription = '';
  String _formDuration = '15min';

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
              maxLength: 50,
              decoration:
                  const InputDecoration(label: Text('Title of the plan')),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              onSaved: (value) {
                _formTitle = value!;
              },
            ),
            TextFormField(
              //maxLength: 50,
              decoration: const InputDecoration(label: Text('Desciption')),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              onSaved: (value) {
                _formDescription = value!;
              },
            ),
            DropdownButtonFormField(
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
            ),
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
                        name: _formTitle,
                        description: _formDescription,
                        //duration: _formDuration), TODO
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
