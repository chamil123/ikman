// lib/views/forms/vehicle_ad_form.dart
import 'package:flutter/material.dart';
import '../Widgets/base_form.dart';


class VehicleAdForm extends BaseAdForm {
  VehicleAdForm({required void Function(Map<String, dynamic>) onSave}) : super(onSave: onSave);

  @override
  List<Widget> buildCategoryFields() {
    return [
      TextFormField(
        decoration: InputDecoration(labelText: 'Make'),
        // Add validation and saving logic
      ),
      TextFormField(
        decoration: InputDecoration(labelText: 'Model'),
        // Add validation and saving logic
      ),
      TextFormField(
        decoration: InputDecoration(labelText: 'Year'),
        keyboardType: TextInputType.number,
        // Add validation and saving logic
      ),
    ];
  }
}

// Similarly, create forms for other categories:
// property_ad_form.dart
// electronic_item_ad_form.dart
// animal_ad_form.dart
// service_ad_form.dart
// education_ad_form.dart
// job_ad_form.dart