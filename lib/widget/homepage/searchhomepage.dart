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
  String filterOption = 'بدون فلترة';

  @override
  void initState() {
    super.initState();
    allPlaces = tabBarData; // تأكد أن tabBarData مستورد
  }

  void search(String query) {
    final search = query.toLowerCase();
    final results = allPlaces.where((place) {
      return place.title.toLowerCase().contains(search) ||
          place.location.toLowerCase().contains(search) ||
          place.airline.toLowerCase().contains(search);
    }).toList();

    setState(() {
      searchResults = results;
    });

    applyFilter(); // بعد البحث نطبق الفلترة
  }

  void applyFilter() {
    if (filterOption == 'السعر: من الأرخص') {
      searchResults.sort((a, b) => a.price.compareTo(b.price));
    } else if (filterOption == 'السعر: من الأعلى') {
      searchResults.sort((a, b) => b.price.compareTo(a.price));
    } else if (filterOption == 'حسب التاريخ') {
      searchResults.sort((a, b) {
        final dateA = DateTime.tryParse(a.date ?? "") ?? DateTime(2100);
        final dateB = DateTime.tryParse(b.date ?? "") ?? DateTime(2100);
        return dateA.compareTo(dateB);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: searchController,
          onChanged: search,
          decoration: InputDecoration(
            hintText: "10".tr,
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

        if (searchController.text.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: DropdownButton<String>(
              value: filterOption,
              items: [
                'بدون فلترة',
                'السعر: من الأرخص',
                'السعر: من الأعلى',
                'حسب التاريخ',
              ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    filterOption = value;
                    applyFilter();
                  });
                }
              },
            ),
          ),

        const SizedBox(height: 10),

        if (searchController.text.isNotEmpty && searchResults.isNotEmpty)
          SizedBox(
            height: size.height * 0.55,
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                final place = searchResults[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        place.image,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(place.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text("${place.location}\n✈️ ${place.airline}"),
                    trailing: Text("${place.price}\$", style: const TextStyle(fontSize: 16)),
                    onTap: () {
                      Get.to(() => DetailsPage(
                            tabData: place,
                            isCameFromPersonSection: false,
                          ));
                    },
                  ),
                );
              },
            ),
          )
        else if (searchController.text.isNotEmpty)
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("لا توجد نتائج مطابقة", style: TextStyle(fontSize: 16)),
          ),
      ],
    );
  }
}
