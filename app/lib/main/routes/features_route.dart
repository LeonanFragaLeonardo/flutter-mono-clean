import 'package:app/features/ui/pages/features_page.dart';
import 'package:app/main/di/features/feature_page_factory.dart';
import 'package:get/get.dart';

GetPage makeFeaturesRoute() =>
    GetPage(name: FeaturesPage.routeName, page: makeFeaturePage);
