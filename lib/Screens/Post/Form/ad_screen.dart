import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Model/Ads/base_model.dart';
import '../../../Model/Ads/mobile_phone.dart';
import '../../../Providers/ads_provider.dart';
import '../Widgets/base_form.dart';
import 'Electronics/mobile_phones_ad_form.dart';
import 'electronic_ad_form.dart';
import 'vehicle_ad_form.dart';

class CreateAdScreen extends StatefulWidget {
  @override
  _CreateAdScreenState createState() => _CreateAdScreenState();
}

class _CreateAdScreenState extends State<CreateAdScreen> {
  GlobalKey<BaseAdFormState> _formKey = GlobalKey<BaseAdFormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Ad')),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Consumer<AdsProvider>(
                  builder: (context, adsProvider, child) {
                    // return _buildCategoryForm(value.getSelectedCaegory!.name);
                    // print("111111 : "+value.getSubCategory!.name);
                    return _buildCategoryForm(adsProvider.getSubCategory!.name);
                    // return _buildCategoryForm(
                    //     "Mobile Phones" ?? "Mobile Phones");
                  },
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              color: Colors.grey.shade200,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: _submitAd,
                    child: Text('Submit'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryForm(String selectedCategory) {
    void onSave(Map<String, dynamic> formData) async {
      final adsProvider = Provider.of<AdsProvider>(context, listen: false);
      try {
        // Convert price from String to double
        // if (formData['price'] is String) {
        //   formData['price'] = double.parse(formData['price']);
        // }
        formData['catId'] =int.parse('${adsProvider.getSelectedCaegory!.id??0}');
        formData['subcatId'] = int.parse('${adsProvider.getSubCategory!.id??0}');
        formData['userId'] = 1;
        formData['location'] =int.parse('${adsProvider.getdistric!.id??0}'); 
        formData['sublocation'] =int.parse('${adsProvider.getCity!.id??0}'); 
        formData['plan_id'] =0; 

        BasePostModel data;
        switch (adsProvider.getSubCategory!.name) {
          case 'Mobile Phones':
            data = MobilePhonePostModel.fromJson(formData);
            break;
          // case 'Vehicles':
          //   data = VehiclePostModel.fromJson(formData);
          //   break;
          // case 'Electronics':
          //   data = ElectronicsPostModel.fromJson(formData);
          //   break;
          default:
            throw Exception('Unsupported category');
        }

        print(data);
        await adsProvider.addAd(data);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ad created successfully')),
        );
      } catch (e) {
        print('Error creating ad: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to create ad: $e')),
        );
      }
    }
    //   void onSave(Map<String, dynamic> formData) async {
    //     final adsProvider = Provider.of<AdsProvider>(context, listen: false);
    //     // try {
    //       BasePostModel data;

    //       switch (adsProvider.getSubCategory!.name) {
    //         case 'Mobile Phones':
    //           data = MobilePhonePostModel.fromJson(formData);
    //           break;
    //         // case 'Vehicles':
    //         //   data = VehiclePostModel.fromJson(formData);
    //         //   break;
    //         // case 'Electronics':
    //         //   data = ElectronicsPostModel.fromJson(formData);
    //         //   break;
    //         default:
    //           throw Exception('Unsupported category');
    //       }
    //    print(data);
    //       await adsProvider.addAd(data);
    //       ScaffoldMessenger.of(context).showSnackBar(
    //         SnackBar(content: Text('Ad created successfully')),
    //       );
    //     // } catch (e) {

    //     //   ScaffoldMessenger.of(context).showSnackBar(
    //     //     SnackBar(content: Text('Failed to create ad: $e')),
    //     //   );
    //     // }
    //   }

    // switch (selectedCategory) {
    //   case 'Mobile Phones':
    //     return MobilePhoneAdForm(key: _formKey, onSave: onSave);
    //   // Add cases for other categories as needed
    //   default:
    //     return Container(child: Text('Unsupported category'));
    // }

    switch (selectedCategory) {
      case 'Mobile Phones':
        return MobilePhoneAdForm(
            // onSave: onSave
            key: _formKey,
            onSave: onSave);
      case 'Vehicles':
        return VehicleAdForm(key: _formKey, onSave: onSave
            // onSave: onSave
            );
      case 'Electronics':
        return ElectronicAdForm(key: _formKey, onSave: onSave
            // onSave: onSave
            );
      // Add cases for other categories
      default:
        return Container();
    }
  }

  void _submitAd() {
    if (_formKey.currentState?.validateAndSave() ?? false) {
      // The form is valid and saved. The onSave callback will handle the submission.
      print("Form submitted successfully");
    } else {
      print("Form validation failed");
    }
  }
}
