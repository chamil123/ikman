import 'package:classic_ads/Providers/ads_provider.dart';
import 'package:classic_ads/Screens/Post/Form/electronic_ad_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'vehicle_ad_form.dart';

class CreateAdScreen extends StatefulWidget {
  @override
  _CreateAdScreenState createState() => _CreateAdScreenState();
}

class _CreateAdScreenState extends State<CreateAdScreen> {
  String _selectedCategory = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Ad')),
      body: SingleChildScrollView(
        child: Column(
          children: [
       
            Consumer<AdsProvider>(
              builder: (context, value, child) {
                // return _buildCategoryForm(value.getSelectedCaegory!.name);
                return _buildCategoryForm("Vehicles");
              },
            ),
            // ElevatedButton(
            //   onPressed: _submitAd,
            //   child: Text('Submit'),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryForm(selectedCategory) {
     void onSave(Map<String, dynamic> formData) async {
      final adsProvider = Provider.of<AdsProvider>(context, listen: false);
      
      try {
        await adsProvider.addAd(formData);
        print(">>>>>>>>>>>>>>>>>>>> : "+formData.toString());
        // Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to create ad: $e')),
        );
      }
    }
    switch (selectedCategory) {
      case 'Vehicles':
        return VehicleAdForm(
        onSave: onSave
        );
      case 'Electronics':
        return ElectronicAdForm(
          onSave: onSave
        );
      // Add cases for other categories
      default:
        return Container();
    }
  }

  void _submitAd() {
    // Validate and submit the ad
  }
}
