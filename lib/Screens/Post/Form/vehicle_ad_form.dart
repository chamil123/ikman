// lib/views/forms/vehicle_ad_form.dart
import 'package:flutter/material.dart';
import '../Widgets/base_form.dart';

class VehicleAdForm extends BaseAdForm {
  // VehicleAdForm({required void Function(Map<String, dynamic>) onSave})
  //     : super(onSave: onSave);
VehicleAdForm({Key? key, required void Function(Map<String, dynamic>) onSave})
      : super(key: key, onSave: onSave);
  @override
  VehicleAdFormState createState() => VehicleAdFormState();
  String dropdownValue = 'One';

  @override
  List<Widget> buildCategoryFields(
      Map<String, dynamic> formData, Function(void Function()) setState) {
    return [
      customTextField(
        "Make",
        (value) => formData['Make'] = value,
        (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter the make';
          }
          return null;
        },
      ),
      customTextField(
        "Model",
        (value) => formData['Model'] =value,
        (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter the model';
          }
          return null;
        },
      ),
      customTextField(
        "Year",
        (value) => formData['Year'] = value,
        (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a valid year';
          }
          return null;
        },
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Condition"),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: RadioListTile<String>(
                  title: Text("New"),
                  value: "New",
                  groupValue: formData['Condition'],
                  onChanged: (value) {
                    setState(() {
                      formData['Condition'] = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: RadioListTile<String>(
                  title: Text("Used"),
                  value: "Used",
                  groupValue: formData['Condition'],
                  onChanged: (value) {
                    setState(() {
                      formData['Condition'] = value;
                    });
                  },
                ),
              ),
            ],
          ),
            if (formData['Condition'] == null)
            Text(
              'Please select a condition',
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
        ],
      ),
      DropdownButtonFormField<String>(
        decoration: InputDecoration(
          // labelText: 'Select an option',
        ),
        value: formData['VehicleType'] ?? 'Select an option',
        validator: (value) {
          if (value == null || value == 'Select an option') {
            return 'Please select a vehicle type';
          }
          return null;
        },
        onChanged: (String? newValue) {
          setState(() {
            formData['VehicleType'] = newValue!;
          });
        },
        items: <String>['Select an option', 'One', 'Two', 'Three', 'Four']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    ];
  }
}

class VehicleAdFormState extends BaseAdFormState {}
