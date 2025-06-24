import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/pages/booked_trips_page.dart';

import '../Controller/booking_controller.dart';
import '../models/tab_bar_model.dart';
import '../widget/reuseable_text.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    super.key,
    required this.tabData,
    required this.isCameFromPersonSection,
  });

  final TabBarModel? tabData;
  final bool isCameFromPersonSection;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int selected = 0;
  dynamic current;

  @override
  void initState() {
    super.initState();
    if (widget.tabData != null) {
      current = widget.tabData;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bookingController = Get.put(BookingController());

    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        double height = constraints.maxHeight;

        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: _buildAppBar(),
          body: Stack(
            children: [
              // Image at the top
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Hero(
                  tag: widget.isCameFromPersonSection
                      ? current.day
                      : current.image,
                  child: Container(
                    width: width,
                    height: height * 0.45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      image: DecorationImage(
                        image: AssetImage(current.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              // Content container
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: width,
                  height: height * 0.65,
                  decoration: const BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: height * 0.02),
                        FadeInUp(
                          delay: const Duration(milliseconds: 200),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: AppText(
                                      text: current.title,
                                      size: width * 0.05,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.location_on,
                                          color: Colors.black54, size: 15),
                                      SizedBox(width: width * 0.01),
                                      AppText(
                                        text: current.location,
                                        size: width * 0.03,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        FadeInUp(
                          delay: const Duration(milliseconds: 300),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Wrap(
                                children: List.generate(
                                    5,
                                    (index) => Icon(
                                          index < 4
                                              ? Icons.star
                                              : Icons.star_border,
                                          color: index < 4
                                              ? Colors.amber
                                              : Colors.grey,
                                          size: width * 0.06,
                                        )),
                              ),
                              AppText(
                                text: current.duration,
                                size: width * 0.035,
                                fontWeight: FontWeight.w500,
                              ),
                              Text("60".tr),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  AppText(
                                    text: "59".tr,
                                    size: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  AppText(
                                    text: "\$${(selected + 1) * current.price}",
                                    size: width * 0.05,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: height * 0.03),
                        FadeInUp(
                          delay: const Duration(milliseconds: 400),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                const Icon(Icons.airplanemode_on_outlined,
                                    color: Colors.black54),
                                SizedBox(
                                  width: 8,
                                ),
                                AppText(
                                    text: current.airline,
                                    size: width * 0.035,
                                    fontWeight: FontWeight.w500),
                                const SizedBox(width: 25),
                                AppText(
                                    text: current.to,
                                    size: width * 0.03,
                                    fontWeight: FontWeight.w500),
                                const SizedBox(width: 15),
                                Text("61".tr),
                                const SizedBox(width: 15),
                                AppText(
                                    text: current.from,
                                    size: width * 0.03,
                                    fontWeight: FontWeight.w500),
                                Text('62'.tr),
                                const SizedBox(width: 10),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                  text: current.date,
                                  size: width * 0.03,
                                  fontWeight: FontWeight.w500),
                              Text('46'.tr),
                            ],
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        AppText(
                          text: '63'.tr,
                          size: width * 0.035,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(
                          height: height * 0.08,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: 7,
                            itemBuilder: (ctx, index) => GestureDetector(
                              onTap: () => setState(() => selected = index),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: AnimatedContainer(
                                  width: width * 0.12,
                                  duration: const Duration(milliseconds: 200),
                                  decoration: BoxDecoration(
                                    color: selected == index
                                        ? Colors.black
                                        : const Color(0xFFF5F5F5),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "${index + 1}",
                                      style: TextStyle(
                                        fontSize: width * 0.045,
                                        fontWeight: FontWeight.w500,
                                        color: selected == index
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.03),
                        FadeInUp(
                          delay: const Duration(milliseconds: 800),
                          child: AppText(
                            text: current.description,
                            size: width * 0.045,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        FadeInUp(
                          delay: const Duration(milliseconds: 1000),
                          child: Padding(
                            padding: EdgeInsets.only(top: height * 0.04),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: width * 0.14,
                                  height: height * 0.06,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.deepPurpleAccent,
                                        width: 2),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.favorite_border,
                                        color: Colors.deepPurpleAccent),
                                  ),
                                ),
                                MaterialButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  minWidth: width * 0.6,
                                  height: height * 0.06,
                                  color: Colors.deepPurpleAccent,
                                  onPressed: () {
                                    bookingController.addTrip(current);
                                    Get.to(() => BookedTripsPage());
                                  },
                                  child: AppText(
                                    text: "65".tr,
                                    size: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.05),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_ios),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert_outlined),
        ),
      ],
    );
  }
}
