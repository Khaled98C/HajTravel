/* الداتا الاساسية قبل التعديل
class TabBarModel {
  final String title;
  final String location;
  final String image;
  final String airline;
  final int price;
  final String description;

  TabBarModel(
      {required this.title,required this.airline,
      required this.location,
      required this.image,
      required this.price, required this.description});
      factory TabBarModel.fromJson(Map<String, dynamic> json) {
  return TabBarModel(
    title: json['title'],
    location: json['location'],
    image: json['image'],
    price: json['price'],
    description: json['description'], airline: '',
  );
}

Map<String, dynamic> toJson() {
  return {
    'title': title,
    'location': location,
    'image': image,
    'price': price,
    'description': description,
  };
}

}

List<TabBarModel> places = [
  TabBarModel(description: "",
      title: "الكعبة المشرفة",

      location:"مكة,السعودية",
     image: "images/maka11.jpg",
      price:4900, 
      airline: "السورية للطيران",
      ),
  TabBarModel(description: " ",airline: "السورية للطيران",
      title: "الكعبة المشرفة ",
      location: "مكة,السعودية",
      image: "images/maka13.jpg",
      price: 4900
      ),
  TabBarModel(description: "",
      title: "الكعبة المشرفة ",
      location: "مكة,السعودية",
      image: "images/porj.jfif",
      price: 4900, airline: '')
];
List<TabBarModel> inspiration = [
  TabBarModel(description: "",
      title: "Unguja",
      location: "Island in Tanzania",
      image: "images/download.jpeg",
      price: 543, airline: ''),
  TabBarModel(description: "",
      title: "Baja Peninsula",
      location: "Mexico",
      image: "images/images.jpeg",
      price: 238, airline: ''),
  TabBarModel(description: "",
      title: "Sossusvlei",
      location: "Salt pan in Namibia",
      image: "images/Sossusvlei.jpg",
      price: 124, airline: '')
];
List<TabBarModel> popular = [
  TabBarModel(
      title: "Dubai",description: "",
      location: "United Arab Emirates",
      image: "images/607d0368488549e7b9179724b0db4940.jpg",
      price: 756, airline: ''),
  TabBarModel(description: "",
      title: "Cancún",
      location: "Mexico",
      image:
          "images/22bab5ad4b9aa1027ad00a84ea7493d2c0c5e666d43d3b9413e332bdbd3f1780.jpg",
      price: 321, airline: ''),
  TabBarModel(description: "",airline: "",
      title: "Crete",
      location: "Greece",
      image: "images/shutterstock_436817194.jpg",
      price: 340),
];
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabBarModel {
  final String title; // اسم العرض أو الوجهة
  final String location; // المدينة أو البلد
  final String image; // صورة للعرض
  final String airline; // اسم شركة الطيران
  final int price; // السعر الإجمالي
  final String description; // وصف إضافي

  // تفاصيل الطيران
  final String? from;
  final String? to;
  final String? date;
  final bool? direct;
  final String? duration;

  // تفاصيل الفندق
  final double? pricePerNight;
  final double? rating;
  final bool? available;
  final String? source;

  TabBarModel({
    required this.title,
    required this.location,
    required this.image,
    required this.airline,
    required this.price,
    required this.description,
    this.from,
    this.to,
    this.date,
    this.direct,
    this.duration,
    this.pricePerNight,
    this.rating,
    this.available,
    this.source,
  });

  factory TabBarModel.fromJson(Map<String, dynamic> json) {
    return TabBarModel(
      title: json['title'],
      location: json['location'],
      image: json['image'],
      airline: json['airline'],
      price: json['price'],
      description: json['description'],
      from: json['from'],
      to: json['to'],
      date: json['date'],
      direct: json['direct'],
      duration: json['duration'],
      pricePerNight: json['pricePerNight']?.toDouble(),
      rating: json['rating']?.toDouble(),
      available: json['available'],
      source: json['source'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'location': location,
      'image': image,
      'airline': airline,
      'price': price,
      'description': description,
      'from': from,
      'to': to,
      'date': date,
      'direct': direct,
      'duration': duration,
      'pricePerNight': pricePerNight,
      'rating': rating,
      'available': available,
      'source': source,
    };
  }
}

List<TabBarModel> tabBarData = [
  TabBarModel(
    title: "33".tr,
    location: "34".tr,
    image: "images/mil.jfif",
    airline: "35".tr,
    price: 6300,
    description: "36".tr,
    from: "37".tr,
    to: "38".tr,
    date: "2025-05-10",
    direct: true,
    duration: "3:40 hour",
    pricePerNight: 400.0,
    rating: 4.6,
    available: true,
    source: "Booking.com",
  ),
  TabBarModel(
    title: "39".tr,
    location: "40".tr,
    image: "images/inter.jpg",
    airline: "35".tr,
    price: 520,
    description: "41".tr,
    from: "37".tr,
    to: "40".tr,
    date: "2025-05-12",
    direct: true,
    duration: "1:25 hour",
    pricePerNight: 320.0,
    rating: 4.4,
    available: false,
    source: "Agoda",
  ),
  TabBarModel(
    title: "42".tr,
    location: "43".tr,
    image: "images/royal.jfif",
    airline: "44".tr,
    price: 2480,
    description: "45".tr,
    from: "37".tr,
    to: "38".tr,
    date: "2025-05-09",
    direct: false,
    duration: "3:00 hour",
    pricePerNight: 190.0,
    rating: 3.9,
    available: true,
    source: "Hotels.com",
  ),
  TabBarModel(
    title: "46".tr,
    location: "40".tr,
    image: "images/tqoa.jpg",
    airline: "44".tr,
    price: 4100,
    description: "47".tr,
    from: "48".tr,
    to: "40".tr,
    date: "2025-06-01",
    direct: true,
    duration: "4:00 hour",
    pricePerNight: 450.0,
    rating: 4.8,
    available: true,
    source: "Agoda",
  ),
  TabBarModel(
    title: '49'.tr,
    location: "34".tr,
    image: "images/sfoa.jpg",
    airline: "35".tr,
    price: 3300,
    description: "50".tr,
    from: "37".tr,
    to: "38".tr,
    date: "2025-05-18",
    direct: true,
    duration: "2:45 hour",
    pricePerNight: 380.0,
    rating: 4.5,
    available: true,
    source: "Booking.com",
  ),
  TabBarModel(
    title: "51".tr,
    location: '40'.tr,
    image: "images/anwar.jfif",
    airline: "السورية ",
    price: 2900,
    description: '52'.tr,
    from: "48".tr,
    to: '40'.tr,
    date: "2025-05-22",
    direct: true,
    duration: "1:55 hour",
    pricePerNight: 410.0,
    rating: 4.3,
    available: true,
    source: "Agoda",
  ),
  TabBarModel(
    title: '53'.tr,
    location: "34".tr,
    image: "images/hel.jpg",
    airline: "44".tr,
    price: 3700,
    description: "52".tr,
    from: "48".tr,
    to: "38",
    date: "2025-06-05",
    direct: true,
    duration: "2:15 hour",
    pricePerNight: 430.0,
    rating: 4.6,
    available: true,
    source: "Booking.com",
  ),
  TabBarModel(
    title: "54".tr,
    location: "34".tr,
    image: "images/eman.jfif",
    airline: "35".tr,
    price: 3150,
    description: "45".tr,
    from: "37".tr,
    to: "38".tr,
    date: "2025-04-15",
    direct: false,
    duration: "3:00 hour",
    pricePerNight: 280.0,
    rating: 4.0,
    available: true,
    source: "Hotels.com",
  ),
  TabBarModel(
    title: '55'.tr,
    location: "34".tr,
    image: "images/mkarm.jpeg",
    airline: '44'.tr,
    price: 3900,
    description: '56'.tr,
    from: "37".tr,
    to: "38".tr,
    date: "2025-07-01",
    direct: false,
    duration: "6:00 hour",
    pricePerNight: 350.0,
    rating: 4.1,
    available: true,
    source: "Agoda",
  ),
  TabBarModel(
    title: "57".tr,
    location: "34".tr,
    image: "images/abo.jfif",
    airline: "35".tr,
    price: 4500,
    description: "58".tr,
    from: "37".tr,
    to: "38".tr,
    date: "2025-08-10",
    direct: true,
    duration: "2:30 hour",
    pricePerNight: 470.0,
    rating: 4.9,
    available: true,
    source: "Booking.com",
  ),
];
