import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/tab_bar_model.dart';
import '../../pages/details_page.dart';

class SearchHomePage extends StatefulWidget {
  const SearchHomePage({super.key});

  @override
  State<SearchHomePage> createState() => _SearchHomePageState();
}

class _SearchHomePageState extends State<SearchHomePage> {
  final TextEditingController searchController = TextEditingController();
  List<TabBarModel> allPlaces = [];
  List<TabBarModel> searchResults = [];

  @override
  void initState() {
    super.initState();
    // تحميل جميع الأماكن
    allPlaces = [...places, ...inspiration, ...popular];
  }

  void search(String query) {
    final results = allPlaces.where((place) {
      final search = query.toLowerCase();
      return place.title.toLowerCase().contains(search) ||
          place.location.toLowerCase().contains(search);
    }).toList();

    setState(() {
      searchResults = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: searchController,
          onChanged: search,
          decoration: InputDecoration(
            hintText: "اكتب اسم المكان أو المدينة...",
            filled: true,
            fillColor: const Color.fromARGB(255, 240, 240, 240),
            prefixIcon: const Icon(Icons.search, color: Colors.black),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 10),
        if (searchResults.isNotEmpty)
          Container(
            height: size.height * 0.3, // مهم جدًا لتفادي مشاكل Layout
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                final place = searchResults[index];
                return ListTile(
                  leading: Image.asset(place.image, width: 60, fit: BoxFit.cover),
                  title: Text(place.title),
                  subtitle: Text(place.location),
                  onTap: () {
                    Get.to(() => DetailsPage(
                          tabData: place,
                          personData: null,
                          isCameFromPersonSection: false,
                        ));
                  },
                );
              },
            ),
          )
      ],
    );
  }
}
