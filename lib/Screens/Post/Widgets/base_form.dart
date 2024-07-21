import 'package:flutter/material.dart';

abstract class BaseAdForm extends StatelessWidget {
   BaseAdForm({super.key,required this.onSave});
 final void Function(Map<String, dynamic>) onSave;

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        TextFormField(
          decoration: InputDecoration(labelText: 'Title'),
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'Description'),
          // Add validation and saving logic
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'Price'),
          keyboardType: TextInputType.number,
          // Add validation and saving logic
        ),
        ...buildCategoryFields(),
        ElevatedButton(
          onPressed: () {
            // Validate and save form
            // Call onSave with form data
          },
          child: Text('Submit Ad'),
        ),
      ],
    ));
  }

  List<Widget> buildCategoryFields();
}
