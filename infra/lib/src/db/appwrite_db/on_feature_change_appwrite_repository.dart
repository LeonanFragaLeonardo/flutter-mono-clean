import 'package:appwrite/appwrite.dart';
import 'package:domain/domain.dart';

class OnFeatureChangeAppWriteRepository implements OnFeatureChangedRepository {
  final Client client;
  List<Feature> featureList = [];

  OnFeatureChangeAppWriteRepository({required this.client}) : featureList = [];

  Future<void> initializeFeatureList() async {
    final database = Database(client);
    final documents = await database.listDocuments(
      collectionId: '622893ccbd61aa312faf',
    );
    final featuresFromAppWrite = List.from(documents.data['documents']);
    featureList = featuresFromAppWrite.map((e) {
      final feature = Feature.fromMap(e);
      return feature;
    }).toList();
  }

  // @override
  // Stream<List<Feature>> onFeatureChanges() {
  //   final realtime = Realtime(client);

  //   final subscription =
  //       realtime.subscribe(['collections.622893ccbd61aa312faf.documents']);
  //   final changedFeature = subscription.stream.map((collection) {
  //     return [Feature.fromMap(collection.payload)];
  //   });

  //   return changedFeature;
  // }

  @override
  Stream<List<Feature>> onFeatureChanges() {
    final realtime = Realtime(client);
    final subscription =
        realtime.subscribe(['collections.622893ccbd61aa312faf.documents']);

    final changedFeature = subscription.stream.map((collection) {
      final newList = featureList.map((feature) {
        if (feature.name == collection.payload['featureName']) {
          return Feature.fromMap(collection.payload);
        }
        return feature;
      }).toList();

      return newList;
    });

    return changedFeature;
  }
}
