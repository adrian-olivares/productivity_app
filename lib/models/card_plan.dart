import 'package:flutter/material.dart';

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
