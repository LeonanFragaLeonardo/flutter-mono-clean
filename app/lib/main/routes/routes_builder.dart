import 'package:app/main/routes/auth_route.dart';
import 'package:app/main/routes/features_route.dart';
import 'package:app/main/routes/home_route.dart';
import 'package:get/get.dart';

List<GetPage> makeRoutes() => [
      makeAuthRoute(),
      makeHomeRoute(),
      makeFeaturesRoute(),
    ];
