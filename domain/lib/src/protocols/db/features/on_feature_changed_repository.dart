import 'package:domain/src/src.dart';

abstract class OnFeatureChangedRepository {
  Stream<List<Feature>> onFeatureChanges();
}
