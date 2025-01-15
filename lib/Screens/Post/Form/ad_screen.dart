import 'dart:io';

import 'package:classic_ads/Model/Ads/Vehicle/car_post_model.dart';
import 'package:classic_ads/Model/MainCategory.dart';
import 'package:classic_ads/Model/SubCategory.dart';
import 'package:classic_ads/Screens/Post/Form/Electronics/computer_accessories.dart';
import 'package:classic_ads/Screens/Post/Form/MotorVehicles/cars.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Model/Ads/Electronics/airconditions_and_electrical_fittings.dart';
import '../../../Model/Ads/Electronics/audio_and_mp3.dart';
import '../../../Model/Ads/Electronics/cameras_and_andamcorder.dart';
import '../../../Model/Ads/Electronics/computer_accessory.dart';
import '../../../Model/Ads/Electronics/computer_and_tablet.dart';
import '../../../Model/Ads/Electronics/electronic_home_appliance.dart';
import '../../../Model/Ads/Electronics/mobile_phone_accessory.dart';
import '../../../Model/Ads/Electronics/other_electronic.dart';
import '../../../Model/Ads/Electronics/tv.dart';
import '../../../Model/Ads/Electronics/tv_and_video_accessory.dart';
import '../../../Model/Ads/Electronics/video_games_and_consoles.dart';
import '../../../Model/Ads/base_model.dart';
import '../../../Model/Ads/mobile_phone.dart';
import '../../../Providers/ads_provider.dart';
import '../../../utils/util_functions.dart';
import '../../Components/custom_loader.dart';
import '../Widgets/base_form.dart';
import 'Electronics/airconditions_and_electrical_fittings.dart';
import 'Electronics/audio_and_mp3.dart';
import 'Electronics/cameras_and_camcorders.dart';
import 'Electronics/computers_and_tablets.dart';
import 'Electronics/electronic_home_appliances.dart';
import 'Electronics/mobile_phone_accessories.dart';
import 'Electronics/mobile_phones_ad_form.dart';
import 'Electronics/other_electronics.dart';
import 'Electronics/tv_and_video_accessories.dart';
import 'Electronics/tvs.dart';
import 'Electronics/video_games_and_consoles.dart';
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
    MainCategory mainCategory = context.read<AdsProvider>().getSelectedCaegory!;
    SubCategory subCategory = context.read<AdsProvider>().getSubCategory!;
    return Scaffold(
      appBar: AppBar(
          title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            mainCategory!.name ?? '',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text(
            subCategory!.name ?? '',
            style: TextStyle(fontSize: 14),
          ),
        ],
      )),
      body: Consumer<AdsProvider>(
        builder: (context, adsProvider, child) {
          return Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    // return _buildCategoryForm(value.getSelectedCaegory!.name);

                    _buildCategoryForm(adsProvider.getSubCategory!.name)
                    // return _buildCategoryForm(
                    //     "Mobile Phones" ?? "Mobile Phones");
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: adsProvider.getIsLoading
                    ? Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 48,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(.3),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: CustomLoader(loadertype: false),
                          ),
                        ),
                      )
                    : Container(
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
          );
        },
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
        formData['catId'] =
            int.parse('${adsProvider.getSelectedCaegory!.id ?? 0}');
        formData['subcatId'] =
            int.parse('${adsProvider.getSubCategory!.id ?? 0}');
        formData['userId'] = 1;
        formData['location'] = int.parse('${adsProvider.getdistric!.id ?? 0}');
        formData['sublocation'] = int.parse('${adsProvider.getCity!.id ?? 0}');
        formData['plan_id'] = 0;

        List<File>? images = adsProvider.getCropImg;

        if (images != null && images.isNotEmpty) {
          // The first image is the main image
          formData['mainImage'] = images[0].path;
          // The rest are sub-images
          // formData['subImages'] = images.skip(1).map((file) => file.path).toList();
          if (images.length > 1) formData['subImages1'] = images[1].path;
          if (images.length > 2) formData['subImages2'] = images[2].path;
          if (images.length > 3) formData['subImages3'] = images[3].path;
          if (images.length > 4) formData['subImages4'] = images[4].path;
        }

        BasePostModel data;
        switch (adsProvider.getSubCategory!.name) {
          case 'Mobile Phones':
            data = MobilePhonePostModel.fromJson(formData);
            break;
          case 'Mobile Phone Accessories':
            data = MobilePhoneAccessoryPostModel.fromJson(formData);
            break;
          case 'Computers & Tablets':
            data = ComputerAndTabletPostModel.fromJson(formData);
            break;
          case 'Computer Accessories':
            data = ComputerAccessoryPostModel.fromJson(formData);
            break;
          case 'Tvs':
            data = TvPostModel.fromJson(formData);
            break;
          case 'TV & Video Accessories':
            data = TvAndVideoAccessoryPostModel.fromJson(formData);
            break;
          case 'Cameras & Camcorders':
            data = CamerasAndCamcorderPostModel.fromJson(formData);
            break;
          case 'Audio & MP3':
            data = AudioAndMP3PostModel.fromJson(formData);
            break;
          case 'Electronic Home Appliances':
            data = ElectronicHomeAppliancesPostModel.fromJson(formData);
            break;
          case 'Air Conditions & Electrical fittings':
            data =
                AirConditionsAndElectricalFittingsPostModel.fromJson(formData);
            break;
          case 'Video Games & Consoles':
            data = VideoGamesAndConsolesPostModel.fromJson(formData);
            break;
          case 'Other Electronics':
            data = OtherElectronicPostModel.fromJson(formData);
            break;
          // case 'Electronics':
          //   data = ElectronicsPostModel.fromJson(formData);
          //   break;
          /////Vehcile
          case 'Cars':
            data = CarPostModel.fromJson(formData);
            break;
          default:
            throw Exception('Unsupported category');
        }
        if (adsProvider.getCropImg == null || adsProvider.getCropImg!.isEmpty) {
          return;
        } else {
          if (await UtilFuntions.isNetworkAvailable()) {
            
            await adsProvider.addAd(context, data);
          } else {
            print("no netwokj wavailable");
          }
        }

        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text('Ad created successfully')),
        // );
        _formKey.currentState?.resetForm();
      } catch (e) {
        print('Error creating ad: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to create ad: $e')),
        );
      }
    }

    switch (selectedCategory) {
      //Electronics
      case 'Mobile Phones':
        return MobilePhoneAdForm(key: _formKey, onSave: onSave);
      case 'Mobile Phone Accessories':
        return MobilePhoneAccessoriesAdForm(key: _formKey, onSave: onSave);
      case 'Computers & Tablets':
        return ComputerAndTabletsAdForm(key: _formKey, onSave: onSave);
      case 'Computer Accessories':
        return ComputerAccessoriesAdForm(key: _formKey, onSave: onSave);
      case 'Tvs':
        return TvsAdForm(key: _formKey, onSave: onSave);
      case 'TV & Video Accessories':
        return TvAndVideoAccessoriesAdForm(key: _formKey, onSave: onSave);
      case 'Cameras & Camcorders':
        return CamerasAndCamcordersAdForm(key: _formKey, onSave: onSave);
      case 'Audio & MP3':
        return AudioAndMP3AdForm(key: _formKey, onSave: onSave);
      case 'Electronic Home Appliances':
        return ElectronicHomeAppliancesAdForm(key: _formKey, onSave: onSave);
      case 'Air Conditions & Electrical fittings':
        return AirConditionsAndElectricalFittingsAdForm(
            key: _formKey, onSave: onSave);
      case 'Video Games & Consoles':
        return VideoGamesAndConsolesAdForm(key: _formKey, onSave: onSave);
      case 'Other Electronics':
        return OtherElectronicsAdForm(key: _formKey, onSave: onSave);
      case 'Electronics':
        return ElectronicAdForm(key: _formKey, onSave: onSave);

      //Vehicles
      case 'Cars':
        return CarsAdForm(key: _formKey, onSave: onSave);
      // case 'Vehicles':
      //   return VehicleAdForm(key: _formKey, onSave: onSave);
      default:
        return Container();
    }
  }

  void _submitAd() {
    if (_formKey.currentState?.validateAndSave() ?? false) {
      // The form is valid and saved. The onSave callback will handle the submission.
      // print("Form submitted successfully");
    } else {
      print("Form validation failed");
    }
  }
}
