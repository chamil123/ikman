import 'package:classic_ads/Controllers/location_controller.dart';
import 'package:classic_ads/Model/District%20.dart';
import 'package:flutter/material.dart';

class LocationProvider extends ChangeNotifier {
  final LocationController _locationController = LocationController();
  List<District> _districts = [];
  bool _isLoading = true;

  List<District> get getDistrics => _districts;
  bool get isLoading => _isLoading;
  Future<void> loadDistricts() async {
    if (_districts.isEmpty) {
      try {
        final districts = await _locationController.fetchDistricts();

        _districts = districts;
        _isLoading = false;
      } catch (e) {
        _isLoading = false;
      } finally {
        notifyListeners();
      }
    }
  }
}
