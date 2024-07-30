// lib/views/forms/vehicle_ad_form.dart
import 'package:flutter/material.dart';
import '../Widgets/base_form.dart';


class VehicleAdForm extends BaseAdForm {
  VehicleAdForm({required void Function(Map<String, dynamic>) onSave})
      : super(onSave: onSave);

  @override
  VehicleAdFormState createState() => VehicleAdFormState();

  @override
  List<Widget> buildCategoryFields(Map<String, dynamic> formData) {
    return [
      TextFormField(
        decoration: InputDecoration(labelText: 'Make'),
        onSaved: (value) => formData['make'] = value,
         validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter the make';
          }
          return null;
        },
      ),
      TextFormField(
        decoration: InputDecoration(labelText: 'Model'),
        onSaved: (value) => formData['model'] = value,
         validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter the model';
          }
          return null;
        },
      ),
      TextFormField(
        decoration: InputDecoration(labelText: 'Year'),
        keyboardType: TextInputType.number,
        onSaved: (value) => formData['year'] = int.tryParse(value ?? ''),
         validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter the year';
          }
          if (int.tryParse(value) == null) {
            return 'Please enter a valid year';
          }
          return null;
        },
      ),
    ];
  }
}

class VehicleAdFormState extends BaseAdFormState {}