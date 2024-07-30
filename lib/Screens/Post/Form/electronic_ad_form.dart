import 'package:flutter/material.dart';

import '../Widgets/base_form.dart';

class ElectronicAdForm extends BaseAdForm {
  ElectronicAdForm({required void Function(Map<String, dynamic>) onSave})
      : super(onSave: onSave);

  @override
  ElectronicAdFormState createState() => ElectronicAdFormState();

  @override
  List<Widget> buildCategoryFields(Map<String, dynamic> formData) {
    return [
      TextFormField(
        decoration: InputDecoration(labelText: 'Brand'),
        onSaved: (value) => formData['brand'] = value,
      ),
      TextFormField(
        decoration: InputDecoration(labelText: 'Model'),
        onSaved: (value) => formData['model'] = value,
      ),
      // Add other electronic-specific fields
    ];
  }
}

class ElectronicAdFormState extends BaseAdFormState {}