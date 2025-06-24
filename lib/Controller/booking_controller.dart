import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/tab_bar_model.dart';

class BookingController extends GetxController {
  final RxList<TabBarModel> bookedTrips = <TabBarModel>[].obs;
  late SharedPreferences _prefs;

  @override
  void onInit() {
    super.onInit();
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    loadTrips();
  }

  String get _userKey {
    final username = _prefs.getString("current_user");
    return "booked_trips_${username ?? 'guest'}";
  }

  Future<void> addTrip(TabBarModel trip) async {
    bookedTrips.add(trip);
    await saveTrips();
    Get.snackbar("66".tr, "${trip.title} ${"67".tr}");
  }

  Future<void> removeTrip(TabBarModel trip) async {
    bookedTrips.remove(trip);
    await saveTrips();
    Get.snackbar("68".tr, "${trip.title} ${"69".tr}");
  }

  Future<void> saveTrips() async {
    List<String> tripsAsJson =
        bookedTrips.map((trip) => json.encode(trip.toJson())).toList();
    await _prefs.setStringList(_userKey, tripsAsJson);
  }

  void loadTrips() {
    final savedTrips = _prefs.getStringList(_userKey);
    if (savedTrips != null) {
      bookedTrips.value = savedTrips
          .map((tripJson) => TabBarModel.fromJson(json.decode(tripJson)))
          .toList();
    }
  }
}
