import 'package:app/main.dart';
import 'package:app/main/di/auth/appwrite_client_config.dart';
import 'package:business/business.dart';
import 'package:domain/domain.dart';
import 'package:infra/infra.dart';
import 'package:presentation/features/getx_features_presenter.dart';

FeaturesPresenter makeGetXFeaturePresenter() {
  final firebaseFeaturesService = OnFeatureChangeFirestoreRepository();

  final featureListWithFirebase = ListenFeatureChangesData(
      featureChangesRepository: firebaseFeaturesService);
  final featureListWithAppWrite = ListenFeatureChangesData(
      featureChangesRepository: MainApp.appWriteFeaturesService);
  // final featureListWithAppWrite = PerformServiceAuthentication(
  //     authenticateByPasswordService: appWriteAuthService);
  return GetXFeaturesPresenter(
    listenFeatureChangesFromAppWrite: featureListWithAppWrite,
    listenFeatureChangesFromFirebase: featureListWithFirebase,
  );
}
