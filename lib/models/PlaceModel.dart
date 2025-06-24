class PlaceModel {
  final String name;
  final String category; // مثال: مسجد، مستشفى...
  final String description;
  final String location; // يمكن تحويله لاحقاً إلى إحداثيات GPS
  final String imagePath;

  PlaceModel({
    required this.name,
    required this.category,
    required this.description,
    required this.location,
    required this.imagePath,
  });
}
