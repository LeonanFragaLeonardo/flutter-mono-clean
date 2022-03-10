import 'package:app/home/ui/pages/home_page.dart';
import 'package:app/main/di/home/home_page_factory.dart';
import 'package:get/get.dart';

GetPage makeHomeRoute() => GetPage(
      name: HomePage.routeName,
      page: makeHomePage,
    );
