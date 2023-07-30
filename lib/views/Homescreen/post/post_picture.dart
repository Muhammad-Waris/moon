import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moon/widgets/app_button.dart';
import 'package:moon/widgets/app_input_field.dart';
import 'package:moon/widgets/app_text.dart';

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  File? _imageFile;
  final picker = ImagePicker();
  final textController = TextEditingController();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);
    setState(() {
      _imageFile = pickedFile != null ? File(pickedFile.path) : null;
    });
  }

  Future<void> _uploadPost() async {
    if (_imageFile == null) return;

    // Upload image to Firebase Storage
    final storageRef = FirebaseStorage.instance
        .ref()
        .child('posts')
        .child(DateTime.now().toString());
    final uploadTask = storageRef.putFile(_imageFile!);
    final taskSnapshot = await uploadTask.whenComplete(() => null);
    final imageUrl = await taskSnapshot.ref.getDownloadURL();

    // Save post data to Firestore
    final text = textController.text.trim();
    if (text.isNotEmpty) {
      FirebaseFirestore.instance.collection('posts').add({
        'text': text,
        'image': imageUrl,
        'timestamp': FieldValue.serverTimestamp(),
      });
    }

    // Clear the form
    textController.clear();
    setState(() {
      _imageFile = null;
    });
    Navigator.pop(context);
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 30,
              ),
              const AppText(
                text: "Make your post from here",
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
              AppInputField(
                controller: textController,
                hintText: 'Write about Your post',
                maxLines: 5,
              ),
              const SizedBox(height: 16.0),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Choose Image Source'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: [
                              GestureDetector(
                                child: const Text('Gallery'),
                                onTap: () {
                                  _pickImage(ImageSource.gallery);
                                  Navigator.of(context).pop();
                                },
                              ),
                              const SizedBox(height: 8.0),
                              GestureDetector(
                                child: const Text('Camera'),
                                onTap: () {
                                  _pickImage(ImageSource.camera);
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  height: 200.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.grey),
                  ),
                  child: _imageFile != null
                      ? Image.file(
                          _imageFile!,
                          fit: BoxFit.cover,
                        )
                      : const Icon(Icons.add_a_photo,
                          size: 64.0, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 26.0),
              AppButton(
                text: "Post",
                onTap: _uploadPost,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
