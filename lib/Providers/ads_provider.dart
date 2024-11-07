import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:classic_ads/Screens/Components/custom_dialog.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:classic_ads/Controllers/model_controller.dart';
import 'package:classic_ads/Model/brand.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:classic_ads/Model/Post.dart';
import 'package:classic_ads/Services/ApiService.dart';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

import '../Controllers/ads_controller.dart';
import '../Controllers/brand_controller.dart';
import '../Model/Ads/base_model.dart';
import '../Model/District .dart';
import '../Model/MainCategory.dart';
import '../Model/SubCategory.dart';
import '../Model/city.dart';
import '../Model/model.dart';

class AdsProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  final BrandController _controller = BrandController();
  final ModelController _modelController = ModelController();
  final AdsController _adsController = AdsController();
  int _currentPage = 1;
  bool _isLoadingMore = false;
  List<Post> _posts = [];
  List<Brand> _brand = [];
  List<Model> _model = [];
  bool _isLeftIconSelected = true;
  bool _isRightIconSelected = false;
  MainCategory? _category;
  SubCategory? _subCategory = null;
  District? _distric = null;
  City? _city = null;
  bool _isLocation = false;
  final ImagePicker _picker = ImagePicker();
  List<File>? _file;
  File? _imgFile;
  int? _brandId;
  bool _isLoading = false;

  List<Post> get getPosts => _posts;
  bool get isLeftIconSelected => _isLeftIconSelected;
  bool get isRightIconSelected => _isRightIconSelected;
  int get currentPage => _currentPage;
  bool get isLoadingMore => _isLoadingMore;
  MainCategory? get getSelectedCaegory => _category;
  SubCategory? get getSubCategory => _subCategory;
  bool get isLocation => _isLocation;
  District? get getdistric => _distric;
  City? get getCity => _city;
  List<Brand> get getBrand => _brand;
  List<Model> get getModel => _model;
  List<File>? get getCropImg => _file;
  File? get getCropImgFile => _imgFile;
  int? get getBrandId => _brandId;
  bool get getIsLoading => _isLoading;

  Future<void> fetchPosts() async {
    if (_isLoadingMore) return;
    try {
      _isLoadingMore = true;
      print('Fetching posts...');
      List<Post> newPosts = await _apiService.getPosts(_currentPage);
      _posts.addAll(newPosts);
      _currentPage++;
      print('Fetched posts: $_posts');
    } catch (e) {
      print('Error fetching posts: $e');
    } finally {
      _isLoadingMore = false;
      notifyListeners();
    }
  }

  Future<void> fetchBrands() async {
    if (_isLoadingMore) return;
    try {
      _isLoadingMore = true;
      print('Fetching brand...');

      List<Brand> brand = await _controller.fetchBrands(_subCategory!.id);

      _brand.addAll(brand);
      print('Fetched brand: $_posts');
    } catch (e) {
      print('Error fetching brand: $e');
    } finally {
      _isLoadingMore = false;
      notifyListeners();
    }
  }

  Future<void> fetchModel() async {
    if (_isLoadingMore) return;
    try {
      _isLoadingMore = true;
      print('Fetching model...');
      List<Model> model = await _modelController.fetchModel(_brandId!);
      _model.clear();

      _model.addAll(model);
      print('Fetched model: $_posts');
    } catch (e) {
      print('Error fetching model: $e');
    } finally {
      _isLoadingMore = false;
      notifyListeners();
    }
  }

  setPrint() {
    print(_posts.toString());
  }

  void toggleSelection(value) {
    if (value == "Left") {
      _isLeftIconSelected = true;
      _isRightIconSelected = false;
    } else if (value == "Right") {
      _isRightIconSelected = true;
      _isLeftIconSelected = false;
    }
    notifyListeners();
  }

  void selectedCategory(MainCategory category) {
    _category = category;
    // _isLocation = isLocation;
    notifyListeners();
  }

  void selectedSubCategory(SubCategory subCategory) {
    _subCategory = subCategory;
    notifyListeners();
  }

  void selectedDistrict(District distric, City city) {
    _distric = distric;
    _city = city;
    notifyListeners();
  }

  void setIsLocation([bool isLocation = false]) {
    _isLocation = isLocation;
    notifyListeners();
  }

  void setSelectedBrandId(int brandId) {
    _brandId = brandId;
    notifyListeners();
  }

  Future<void> addAd(BuildContext context, BasePostModel data) async {
    setLoading(true);
    await _adsController.postAd(data).then((response) {
      setLoading(false);
      print(response.toString());

      if (response != null && response is Map<String, dynamic>) {
        // _success = response['status'] ?? false;

        if (response['status'] ?? false) {
          // if(response)
          DialogBox().dialogBox(context, DialogType.success, 'Success',
              response['message'].toString()?? "", false, () {}, () {});
        } else {
          DialogBox().dialogBox(context, DialogType.error, 'Error',
              response['message'].toString() ?? "", false, () {}, () {});
        }
      }
    });
    clearFormData();
  }

  void clearFormData() {
    _file = [];
    _imgFile = null;
    // _category = null;
    // _subCategory = null;
    // _distric = null;
    // _city = null;
    // _brandId = null;
    // _isLocation = false;
    notifyListeners();
  }
  // Future<void> selectImage(ImageSource source) async {
  //   try {
  //     final XFile? pickFile = await _picker.pickImage(
  //         source: ImageSource.gallery, imageQuality: 50);
  //     if (pickFile != null) {
  //       CroppedFile? croppedFile = await ImageCropper().cropImage(
  //         sourcePath: pickFile.path,
  //         aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
  //       );
  //       if (croppedFile == null) {
  //         return;
  //       }
  //       File compressedFile = await compressImage(croppedFile.path, 35);

  //       _file ??= []; // Initialize the list if it's null
  //       _file!.add(compressedFile);
  //       Logger().d(">>>>> : " + _file!.length.toString());
  //       notifyListeners();
  //     } else {
  //       Logger().e("no image selected");
  //     }
  //   } catch (e) {
  //     Logger().e(e);
  //   }
  // }
  Future<void> selectImage(ImageSource source) async {
    try {
      final XFile? pickFile =
          await _picker.pickImage(source: source, imageQuality: 50);
      if (pickFile != null) {
        CroppedFile? croppedFile = await ImageCropper().cropImage(
          sourcePath: pickFile.path,
          aspectRatio: const CropAspectRatio(ratioX: 380, ratioY: 270),
          cropStyle: CropStyle.rectangle,
          uiSettings: [
            AndroidUiSettings(
              toolbarTitle: 'Crop Image',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: true, // Unlock for free-form cropping
            ),
            IOSUiSettings(
              title: 'Crop Image',

              resetAspectRatioEnabled: true,
              aspectRatioLockEnabled: false, // Disables aspect ratio lock
            ),
          ],
        );
        if (croppedFile == null) {
          return;
        }
        File compressedFile = await compressImage(croppedFile.path, 35);

        _file ??= []; // Initialize the list if it's null
        _file!.add(compressedFile);
        _imgFile = compressedFile;
        notifyListeners();
      } else {
        Logger().e("no image selected");
      }
    } catch (e) {
      Logger().e(e);
    }
  }

  Future<File> compressImage(String path, int quality) async {
    final newPath = p.join((await getTemporaryDirectory()).path,
        '${DateTime.now()}.${p.extension(path)}');
    final result = await FlutterImageCompress.compressAndGetFile(
      path,
      newPath,
      quality: quality,
    );
    return File(result!.path);
  }

  void setLoading([bool val = false]) {
    _isLoading = val;
    notifyListeners();
  }
}
