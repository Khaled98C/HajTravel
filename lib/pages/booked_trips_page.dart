import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/booking_controller.dart';

import '../models/tab_bar_model.dart';

class BookedTripsPage extends StatelessWidget {
  final BookingController controller = Get.put(BookingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("الرحلات المحجوزة")),
      body: Obx(() {
        if (controller.bookedTrips.isEmpty) {
          return Center(child: Text("لا توجد رحلات محجوزة بعد"));
        }
        return ListView.builder(
          itemCount: controller.bookedTrips.length,
          itemBuilder: (context, index) {
            final trip = controller.bookedTrips[index];
            return Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                leading: Image.asset(trip.image, width: 60, fit: BoxFit.cover),
                title: Text(trip.title),
                subtitle: Text("${trip.location}"),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    controller.removeTrip(trip);
                  },
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
