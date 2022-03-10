import 'package:domain/domain.dart';

class ListenFeatureChangesData implements ListenFeatureChanges {
  final OnFeatureChangedRepository featureChangesRepository;

  ListenFeatureChangesData({required this.featureChangesRepository});
  @override
  Stream<List<Feature>> call() {
    return featureChangesRepository.onFeatureChanges();
  }
}
