import 'package:domain/src/entities/feature.dart';

abstract class GetFeatures {
  Future<List<Feature>> call();
}
