import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moon/views/Homescreen/post/post_picture.dart';
import 'package:moon/views/Homescreen/post/post_video.dart';
import 'package:moon/views/profile/profile2.dart';
import 'package:share_plus/share_plus.dart';
import '../../constants/appcolors.dart';
import '../../constants/apppadding.dart';
import '../../constants/svgicons.dart';
import '../../widgets/app_input_field.dart';
import '../../widgets/app_text.dart';
import 'messages/messages1.dart';

class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({Key? key}) : super(key: key);

  @override
  _HomeScreen1State createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  final TextEditingController _search = TextEditingController();
  Stream<QuerySnapshot<Map<String, dynamic>>>? _searchQuery;
  String _searchText = '';
  List<String> commentsList = [];
  bool showAllComments = false;
  final TextEditingController _commentController = TextEditingController();
  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  Future<List<QueryDocumentSnapshot>> getPosts() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('posts')
        .orderBy('timestamp', descending: true)
        .get();
    return snapshot.docs;
  }

  void addComment(String comment) {
    setState(() {
      commentsList.add(comment);
      _commentController.clear();
    });
  }

  bool _isFavorite = false;

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.botoombackColor,
      appBar: AppBar(
        leadingWidth: 100,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15, top: 18, bottom: 18),
          child: Row(
            children: [
              SvgPicture.string(SvgIcons.logo),
              const AppText(text: "moon")
            ],
          ),
        ),
        backgroundColor: const Color(0xff171B2E),
        actions: [
          Row(
            children: [
              const SizedBox(
                width: 11,
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xff1E233A),
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const Messages1();
                    }));
                  },
                  child: Center(child: SvgPicture.string(SvgIcons.message)),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.defaultPadding,
          child: Column(
            children: [
              const SizedBox(
                height: 11,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return UploadPage();
                        }));
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: const Color(0xff1E233A),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all()),
                        child:
                            const Center(child: AppText(text: "Post Picture")),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return UploadVideoPage();
                        }));
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: const Color(0xff1E233A),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all()),
                        child: const Center(child: AppText(text: "Post Video")),
                      ),
                    ),
                  ),
                ],
              ),
              AppInputField(
                hintText: "Search in public..",
                prefixIcon: const Icon(Icons.search),
                controller: _search,
                onChanged: (value) {
                  setState(() {
                    _searchText = value;
                    if (_searchText.isNotEmpty) {
                      _searchQuery = FirebaseFirestore.instance
                          .collection('update')
                          .where('name', isGreaterThanOrEqualTo: _searchText)
                          .where('name',
                              isLessThanOrEqualTo: '$_searchText\uf8ff')
                          .orderBy('name', descending: false)
                          .snapshots();
                    } else {
                      _searchQuery = null;
                    }
                  });
                },
              ),
              if (_searchText.isEmpty)
                FutureBuilder<List<QueryDocumentSnapshot>>(
                  future: getPosts(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      final posts = snapshot.data ?? [];
                      return Column(
                        children: posts.map((doc) {
                          final data = doc.data() as Map<String, dynamic>;
                          final image = data['image'] as String;
                          final text = data['text'] as String;

                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/tikprofile.png",
                                        height: 45,
                                        width: 45,
                                      ),
                                      const SizedBox(
                                        width: 22,
                                      ),
                                      const AppText(text: "Luqman"),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 22,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.73,
                                child: Row(
                                  children: [
                                    AppText(
                                      text: text,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(55),
                                child: Image.network(
                                  image,
                                  height: 300,
                                  width:
                                      MediaQuery.of(context).size.width * 0.78,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      await Share.share("This is lit");
                                    },
                                    child: const Icon(
                                      Icons.share,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _toggleFavorite();
                                    },
                                    child: Icon(
                                      _isFavorite
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: _isFavorite
                                          ? Colors.red
                                          : Colors.white,
                                      size: 24.0,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 22),
                                child: Row(
                                  children: [
                                    AppText(text: "Luqman"),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          );
                        }).toList(),
                      );
                    }
                  },
                ),
              if (_searchText.isNotEmpty)
                StreamBuilder<QuerySnapshot<Map<String, dynamic>>?>(
                  stream: _searchQuery,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      final data = snapshot.data?.docs ?? [];
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          final doc = data[index].data();
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Profile2(
                                  imageUrls: doc['imageUrls'],
                                  name: doc['name'] as String?,
                                  intro: doc['intro'] as String?,
                                  uid: doc['uid'] as String?,
                                  dateofBirth: doc['dateOfBirth'] as String?,
                                  know: doc["know"] as String?,
                                );
                              }));
                            },
                            child: ListTile(
                              leading: doc['imageUrls'] != null &&
                                      doc['imageUrls'].isNotEmpty
                                  ? CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          doc['imageUrls'][0] as String),
                                    )
                                  : const CircleAvatar(), // Use a default avatar or empty CircleAvatar if imageUrl is null or empty
                              title: Text(
                                doc['name'] ??
                                    '', // Provide a default value if name is null
                                style: const TextStyle(color: Colors.white),
                              ),
                              subtitle: Text(
                                doc['intro'] ??
                                    '', // Provide a default value if name is null
                                style: GoogleFonts.poppins(
                                  color:
                                      const Color.fromARGB(255, 194, 193, 193),
                                  fontSize: 10,
                                ),
                              ),
                              // Customize the remaining properties of the ListTile as per your needs
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              const SizedBox(
                height: 11,
              ),
              Image.asset("assets/post.png"),
              Image.asset("assets/post2.png"),
            ],
          ),
        ),
      ),
    );
  }
}
