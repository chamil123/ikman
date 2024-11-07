import 'package:get/get.dart';

import '../Screens/Home/main_screen.dart';
import '../Screens/Post/AdComponants/location_screen.dart';
import '../Screens/Post/Form/ad_screen.dart';
import '../Screens/Post/view_post_details.dart';
import '../Screens/Search/SubCategoryScreen.dart';
import '../Screens/Search/filter_screen.dart';
import '../Screens/Search/category_screen.dart';
import '../Screens/no_connection_screen.dart';

final routes = [
  // ... other routes ...
  GetPage(
    name: '/',
    page: () => HomeScreen(),
  ),
  GetPage(
    name: '/view-post-details',
    page: () => ViewPostDetails(post: Get.arguments['post']),
    transition: Transition.cupertino,
    fullscreenDialog: true,
  ),
  GetPage(
    name: '/filter-screen',
    page: () => FilterScreen(),
    transition: Transition.cupertino,
    fullscreenDialog: true,
  ),
  GetPage(
    name: '/category-screen',
    page: () => CategoryScreen(),
    transition: Transition.cupertino,
    fullscreenDialog: true,
  ),
  GetPage(
    name: '/sub-category-screen',
    page: () => SubCategoryScreen(
        categoryName: Get.arguments['categoryName'],
        categoryIconUrl: Get.arguments['categoryIconUrl']),
    transition: Transition.cupertino,
    fullscreenDialog: true,
  ),
  GetPage(
    name: '/location-screen',
    page: () => LocationScreen(),
    transition: Transition.cupertino,
    fullscreenDialog: true,
  ),
  GetPage(
    name: '/ad-screen',
    page: () => CreateAdScreen(),
    transition: Transition.cupertino,
    fullscreenDialog: true,
  ),
  GetPage(
    name: '/no-connection-screen',
    page: () => ConnectionScreen(),
    transition: Transition.cupertino,
    fullscreenDialog: true,
  ),
];
