import 'package:get/get.dart';

import '../models/PlaceModel.dart';


class PlacesController extends GetxController {
  var places = <PlaceModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadPlaces();
  }

  void loadPlaces() {
    places.value = [
  PlaceModel(
    name: 'المسجد الحرام',
    category: 'مسجد',
    description: 'أعظم مسجد في الإسلام، يقع في مكة المكرمة.',
    location: 'مكة - الحرم المكي',
    imagePath: 'images/2a.png',
  ),
  PlaceModel(
    name: 'مستشفى أجياد',
    category: 'مستشفى',
    description: 'مستشفى حكومي قريب من الحرم.',
    location: 'شارع أجياد العام، مكة',
    imagePath: 'images/ajead.jfif',
  ),
  PlaceModel(
    name: 'محطة قطار الحرمين - مكة',
    category: 'محطة قطار',
    description: 'توفر الوصول إلى المدينة، جدة، ومطار الملك عبد العزيز.',
    location: 'محطة الرصيفة، مكة',
    imagePath: 'images/train.jpeg',
  ),
  PlaceModel(
    name: 'مسجد التنعيم (مسجد السيدة عائشة)',
    category: 'مسجد',
    description: 'ميقات أهل مكة للإحرام، مكان مناسب للإحرام من داخل مكة.',
    location: 'حي التنعيم، مكة',
    imagePath: 'images/ta.jfif',
  ),
  PlaceModel(
    name: 'دورات مياه باب الملك فهد',
    category: 'دورات مياه',
    description: 'خدمة مجانية ونظيفة للزوار قرب باب الملك فهد.',
    location: 'بوابة الملك فهد، المسجد الحرام',
    imagePath: 'images/hm.jpg',
  ),
  PlaceModel(
    name: 'مستشفى النور التخصصي',
    category: 'مستشفى',
    description: 'أكبر مستشفى في مكة يقدم رعاية طبية شاملة للحجاج.',
    location: 'طريق المدينة المنورة، مكة',
    imagePath: 'images/nor.jpg',
  ),
  PlaceModel(
    name: 'محطة قطار مشعر منى',
    category: 'محطة قطار',
    description: 'تربط بين منى، عرفات، ومزدلفة عبر قطار المشاعر.',
    location: 'مشعر منى',
    imagePath: 'images/mna.jpg',
  ),
  PlaceModel(
    name: 'مركز صحي الحرم',
    category: 'مركز صحي',
    description: 'رعاية طبية فورية للحجاج داخل نطاق الحرم.',
    location: 'منطقة الحرم، مكة',
    imagePath: 'images/sha.jpg',
  ),
];

  }
}
