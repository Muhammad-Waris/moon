import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moon/constants/apppadding.dart';
import 'package:moon/widgets/app_button.dart';
import 'package:moon/widgets/app_input_field.dart';
import 'package:moon/widgets/app_text.dart';
import '../../constants/appcolors.dart';
import '../../constants/svgicons.dart';
import 'notifications.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({super.key});

  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  List<String> selectedGenres = [];
  List<String> selectedPassions = [];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _introController = TextEditingController();
  final TextEditingController _knowController = TextEditingController();

  File? imageFile;
  File? imageFile2;
  File? imageFile3;
  File? imageFile4;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.appBackgroundColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                height: 35,
                width: 35,
                decoration: const BoxDecoration(
                    color: Color(0xff1E222E),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 36, 35, 35),
                        blurRadius: 2,
                      )
                    ]),
                child: SvgPicture.string(SvgIcons.backbutton)),
          ),
        ),
        title: const AppText(
          text: "Account Settings",
          fontSize: 14,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Notifications();
                }));
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xff1E233A),
                    )),
                child: const Center(
                  child: Icon(Icons.notifications),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.defaultPadding,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Center(
                child: SizedBox(
                  height: 115,
                  width: 115,
                  child: Stack(
                    clipBehavior: Clip.none,
                    fit: StackFit.expand,
                    children: [
                      CircleAvatar(
                        radius: 0.0,
                        backgroundColor: Colors.grey[300],
                        backgroundImage: (imageFile != null)
                            ? Image.file(
                                imageFile!,
                                fit: BoxFit.cover,
                              ).image
                            : const AssetImage("assets/pic.png"),
                      ),
                      Positioned(
                        right: -16,
                        bottom: 0,
                        child: SizedBox(
                          height: 46,
                          width: 46,
                          child: GestureDetector(
                            onTap: getImage,
                            child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.white),
                                child: const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Icon(
                                    Icons.add_a_photo,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AppInputField(
                upperText: "Name",
                hintText: "Jhon Smith",
                controller: _nameController,
                ontap2: () {},
              ),
              AppInputField(
                upperText: "Phone",
                controller: _phoneController,
                hintText: "Enter your phone number",
                keyboardtype: TextInputType.phone,
                ontap2: () {},
              ),
              AppInputField(
                upperText: "Date of Birth",
                controller: _dateController,
                hintText: "01/01/2000",
              ),
              AppInputField(
                upperText: "Introduce",
                hintText: "Say something about you",
                controller: _introController,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 44, vertical: 44),
                ontap2: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  AppText(
                    text: "Photos",
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: getImage2,
                    child: Container(
                      height: 120,
                      width: MediaQuery.of(context).size.width * 0.27,
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(22),
                          image: DecorationImage(
                              image: (imageFile != null)
                                  ? Image.file(
                                      imageFile!,
                                      fit: BoxFit.cover,
                                    ).image
                                  : const NetworkImage(
                                      "https://media.gettyimages.com/id/157482029/photo/stack-of-books.jpg?s=612x612&w=gi&k=20&c=_Yaofm8sZLZkKs1eMkv-zhk8K4k5u0g0fJuQrReWfdQ=",
                                    ),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  GestureDetector(
                    onTap: getImage3,
                    child: Container(
                      height: 120,
                      width: MediaQuery.of(context).size.width * 0.27,
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(22),
                          image: DecorationImage(
                              image: (imageFile != null)
                                  ? Image.file(
                                      imageFile!,
                                      fit: BoxFit.cover,
                                    ).image
                                  : const NetworkImage(
                                      "https://media.gettyimages.com/id/157482029/photo/stack-of-books.jpg?s=612x612&w=gi&k=20&c=_Yaofm8sZLZkKs1eMkv-zhk8K4k5u0g0fJuQrReWfdQ=",
                                    ),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  GestureDetector(
                    onTap: getImage4,
                    child: Container(
                      height: 120,
                      width: MediaQuery.of(context).size.width * 0.27,
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(22),
                          image: DecorationImage(
                              image: (imageFile != null)
                                  ? Image.file(
                                      imageFile!,
                                      fit: BoxFit.cover,
                                    ).image
                                  : const NetworkImage(
                                      "https://media.gettyimages.com/id/157482029/photo/stack-of-books.jpg?s=612x612&w=gi&k=20&c=_Yaofm8sZLZkKs1eMkv-zhk8K4k5u0g0fJuQrReWfdQ=",
                                    ),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ],
              ),
              AppInputField(
                upperText: "Lifestyle",
                hintText: "I don't know",
                controller: _knowController,
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  AppText(
                    text: "Genre",
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GenreContainer(genre: "Genre 1"),
                  GenreContainer(genre: "Genre 2"),
                  GenreContainer(genre: "Genre 3"),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  AppText(
                    text: "Passion(6)",
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PassionContainer(passion: "Passion 1"),
                  PassionContainer(passion: "Passion 2"),
                  PassionContainer(passion: "Passion 3"),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              AppButton(
                text: "Update Now",
                onTap: _uploadData,
                isLoading: _isLoading,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _saveDataFire(List<String?> imageUrls) async {
    final String name = _nameController.text;
    final String phone = _phoneController.text;
    final String dateOfBirth = _dateController.text;
    final String intro = _introController.text;
    final String know = _knowController.text;

    final CollectionReference usersCollection =
        FirebaseFirestore.instance.collection("update");

    final String uid = FirebaseAuth.instance.currentUser!.uid;

    await usersCollection.add({
      "uid": uid,
      "name": name,
      "phone": phone,
      "dateOfBirth": dateOfBirth,
      "intro": intro,
      "know": know,
      "imageUrls": imageUrls,
      "genres": selectedGenres,
      "passions": selectedPassions,
    });
  }

  Future getImage() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null) {
      setState(() {
        imageFile = File(result.files.single.path!);
      });
    }
  }

  Future getImage2() async {
    FilePickerResult? result2 =
        await FilePicker.platform.pickFiles(type: FileType.image);

    if (result2 != null) {
      setState(() {
        imageFile2 = File(result2.files.single.path!);
      });
    }
  }

  Future getImage3() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null) {
      setState(() {
        imageFile3 = File(result.files.single.path!);
      });
    }
  }

  Future getImage4() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null) {
      setState(() {
        imageFile4 = File(result.files.single.path!);
      });
    }
  }

  Future<void> _uploadData() async {
    try {
      setState(() {
        _isLoading = true;
      });
      // Step 1: Upload images to Firebase Storage
      final List<File?> images = [
        imageFile,
        imageFile2,
        imageFile3,
        imageFile4,
      ];
      final List<String?> imageUrls = await _uploadImages(images);

      // Step 2: Save data to Firebase Firestore
      await _saveDataFire(imageUrls);

      // Show success message or perform any other action
      setState(() {
        _isLoading = false;
      });

      // Show success message and navigate back
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Data uploaded successfully!"),
        ),
      );
      Navigator.pop(context);
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      // Handle errors
      print("Error uploading data: $e");
    }
  }

  Future<List<String?>> _uploadImages(List<File?> images) async {
    final List<String?> imageUrls = [];

    for (File? image in images) {
      if (image != null) {
        final Reference storageReference = FirebaseStorage.instance
            .ref()
            .child("images/${DateTime.now().millisecondsSinceEpoch}.jpg");
        final UploadTask uploadTask = storageReference.putFile(image);
        final TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});

        if (taskSnapshot.state == TaskState.success) {
          final String? downloadUrl = await taskSnapshot.ref.getDownloadURL();
          imageUrls.add(downloadUrl);
        }
      }
    }

    return imageUrls;
  }

  Future<void> _saveDataa(List<String?> imageUrls) async {
    final String name = _nameController.text;
    final String phone = _phoneController.text;
    final String dateOfBirth = _dateController.text;
    final String intro = _introController.text;
    final String know = _knowController.text;

    final CollectionReference usersCollection =
        FirebaseFirestore.instance.collection("update");

    // Get the UID of the current user
    final String uid = FirebaseAuth.instance.currentUser!.uid;

    await usersCollection.add({
      "uid": uid,
      "name": name,
      "phone": phone,
      "dateOfBirth": dateOfBirth,
      "intro": intro,
      "know": know,
      "imageUrls": imageUrls,
      "genres": selectedGenres,
      "passions": selectedPassions,
    });
  }
}

class GenreContainer extends StatefulWidget {
  final String genre;

  const GenreContainer({required this.genre});

  @override
  _GenreContainerState createState() => _GenreContainerState();
}

class _GenreContainerState extends State<GenreContainer> {
  bool isSelected = false;
  List<String> selectedGenres = [];
  List<String> selectedPassions = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          if (isSelected) {
            selectedGenres.add(widget.genre);
          } else {
            selectedGenres.remove(widget.genre);
          }
        });
      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width * 0.25,
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : const Color(0xff1E233A),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: AppText(text: widget.genre),
        ),
      ),
    );
  }
}

class PassionContainer extends StatefulWidget {
  final String passion;

  const PassionContainer({required this.passion});

  @override
  _PassionContainerState createState() => _PassionContainerState();
}

class _PassionContainerState extends State<PassionContainer> {
  bool isSelected = false;
  List<String> selectedGenres = [];
  List<String> selectedPassions = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          if (isSelected) {
            selectedPassions.add(widget.passion);
          } else {
            selectedPassions.remove(widget.passion);
          }
        });
      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width * 0.25,
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : const Color(0xff1E233A),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: AppText(text: widget.passion),
        ),
      ),
    );
  }
}
