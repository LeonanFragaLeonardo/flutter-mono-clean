import 'package:domain/src/entities/feature.dart';

abstract class ListenFeatureChanges {
  Stream<List<Feature>> call();
}
