import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/domain.dart';

class OnFeatureChangeFirestoreRepository implements OnFeatureChangedRepository {
  @override
  Stream<List<Feature>> onFeatureChanges() {
    final featuresSnapshot =
        FirebaseFirestore.instance.collection('features').snapshots();
    final convertSnapshotToEntity = featuresSnapshot.map((collection) {
      final List<QueryDocumentSnapshot<Map<String, dynamic>>> data =
          collection.docs;
      final convertedDocument = data.map((doc) {
        final data = doc.data();
        return Feature.fromMap(data);
      }).toList(growable: true);
      return convertedDocument;
    });
    return convertSnapshotToEntity;
  }
}
