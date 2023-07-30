import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final CollectionReference messagesCollection =
      FirebaseFirestore.instance.collection('messages');

  Future<void> sendMessage(String uid, String message) async {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    await messagesCollection.add({
      'uid': uid,
      'message': message,
      'timestamp': timestamp,
    });
  }

  Stream<QuerySnapshot> getMessages() {
    return messagesCollection.orderBy('timestamp').snapshots();
  }
}
