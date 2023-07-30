import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServiceGroup {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> sendMessage(String group) async {
    try {
      // Create a new document in the "messages" collection with the message content
      await _firestore.collection('group').add({
        'group': group,
        'timestamp': DateTime.now(),
      });
    } catch (e) {
      // Handle any errors that occur during message sending
      print('Error sending message: $e');
    }
  }

  Stream<QuerySnapshot> getMessages() {
    // Listen to changes in the "messages" collection and return a stream of snapshots
    return _firestore.collection('group').orderBy('timestamp').snapshots();
  }
}