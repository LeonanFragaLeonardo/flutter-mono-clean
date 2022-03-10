import 'package:app/features/ui/pages/features_page.dart';
import 'package:app/main/di/features/feature_presenter_factory.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget makeFeaturePage() {
  final presenter = Get.put<FeaturesPresenter>(makeGetXFeaturePresenter());
  return FeaturesPage(
    featuresPresenter: presenter,
  );
}
