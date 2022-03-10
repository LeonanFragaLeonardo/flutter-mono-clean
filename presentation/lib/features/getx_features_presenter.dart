import 'package:domain/domain.dart';
import 'package:get/get.dart';

class GetXFeaturesPresenter extends GetxController
    implements FeaturesPresenter {
  final ListenFeatureChanges listenFeatureChangesFromFirebase;
  final ListenFeatureChanges listenFeatureChangesFromAppWrite;
  GetXFeaturesPresenter({
    required this.listenFeatureChangesFromFirebase,
    required this.listenFeatureChangesFromAppWrite,
  });

  @override
  Stream<List<Feature>> onFeatureChanges(
      {required AuthServiceEnum serviceName}) {
    switch (serviceName) {
      case AuthServiceEnum.firebase:
        return listenFeatureChangesFromFirebase();
      case AuthServiceEnum.appwrite:
        return listenFeatureChangesFromAppWrite();
      default:
        return listenFeatureChangesFromFirebase();
    }
  }
}
