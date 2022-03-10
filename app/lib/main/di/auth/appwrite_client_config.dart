import 'package:appwrite/appwrite.dart';

Client makeAppWriteClientConfig() {
  final client = Client(endPoint: 'http://localhost/v1', selfSigned: true);
  client.setProject('62260a711f9ef90532ad');
  return client;
}
