import 'package:domain/src/entities/entities.dart';

abstract class FeaturesPresenter {
  Stream<List<Feature>> onFeatureChanges(
      {required AuthServiceEnum serviceName});
}
