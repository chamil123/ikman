import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ikman/Providers/AdsProvider.dart';
import 'package:ikman/Providers/MainCategoryProvider.dart';
import 'package:provider/provider.dart';
import 'routes.dart'; // Import your routes

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AdsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MainCategorProvider(),
        ),
      ],
      child: GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/', // Set the initial route
        getPages: routes, // Pass your routes
      ),
    ),
  );
}
