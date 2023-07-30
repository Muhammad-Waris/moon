import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moon/widgets/app_button.dart';
import 'package:moon/widgets/app_input_field.dart';
import 'package:moon/widgets/app_text.dart';

class UploadVideoPage extends StatefulWidget {
  @override
  _UploadVideoPageState createState() => _UploadVideoPageState();
}

class _UploadVideoPageState extends State<UploadVideoPage> {
  File? _videoFile;
  final picker = ImagePicker();
  final textController = TextEditingController();

  Future<void> _pickVideo(ImageSource source) async {
    final pickedFile = await picker.getVideo(source: source);
    setState(() {
      _videoFile = pickedFile != null ? File(pickedFile.path) : null;
    });
  }

  Future<void> _uploadVideo() async {
    if (_videoFile == null) return;

    // Upload video to Firebase Storage
    final storageRef = FirebaseStorage.instance
        .ref()
        .child('videos')
        .child(DateTime.now().toString());
    final uploadTask = storageRef.putFile(_videoFile!);
    final taskSnapshot = await uploadTask.whenComplete(() => null);
    final videoUrl = await taskSnapshot.ref.getDownloadURL();

    // Save video data to Firestore
    final text = textController.text.trim();
    if (text.isNotEmpty) {
      await FirebaseFirestore.instance.collection('videos').add({
        'text': text,
        'video': videoUrl,
        'timestamp': FieldValue.serverTimestamp(),
      });
    }

    // Clear the form
    textController.clear();
    setState(() {
      _videoFile = null;
    });

    // Navigate back to the previous page
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
                text: "Make your video post from here",
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
              AppInputField(
                controller: textController,
                hintText: 'Write about your video',
                maxLines: 5,
              ),
              const SizedBox(height: 16.0),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Choose Video Source'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: [
                              GestureDetector(
                                child: const Text('Gallery'),
                                onTap: () {
                                  _pickVideo(ImageSource.gallery);
                                  Navigator.of(context).pop();
                                },
                              ),
                              const SizedBox(height: 8.0),
                              GestureDetector(
                                child: const Text('Camera'),
                                onTap: () {
                                  _pickVideo(ImageSource.camera);
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
                  child: _videoFile != null
                      ? Icon(
                          Icons.video_library,
                          size: 64.0,
                          color: Colors.grey,
                        )
                      : const Icon(
                          Icons.video_call,
                          size: 64.0,
                          color: Colors.grey,
                        ),
                ),
              ),
              const SizedBox(height: 26.0),
              AppButton(
                text: "Post",
                onTap: _uploadVideo,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
