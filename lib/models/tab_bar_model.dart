class TabBarModel {
  final String title;
  final String location;
  final String image;
  
  final int price;
  final String description;

  TabBarModel(
      {required this.title,
      required this.location,
      required this.image,
      required this.price, required this.description});
      factory TabBarModel.fromJson(Map<String, dynamic> json) {
  return TabBarModel(
    title: json['title'],
    location: json['location'],
    image: json['image'],
    price: json['price'],
    description: json['description'],
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
      price:4900
      ),
  TabBarModel(description: " ",
      title: "الكعبة المشرفة ",
      location: "مكة,السعودية",
      image: "images/maka13.jpg",
      price: 4900
      ),
  TabBarModel(description: "",
      title: "الكعبة المشرفة ",
      location: "مكة,السعودية",
      image: "images/porj.jfif",
      price: 4900)
];
List<TabBarModel> inspiration = [
  TabBarModel(description: "",
      title: "Unguja",
      location: "Island in Tanzania",
      image: "images/download.jpeg",
      price: 543),
  TabBarModel(description: "",
      title: "Baja Peninsula",
      location: "Mexico",
      image: "images/images.jpeg",
      price: 238),
  TabBarModel(description: "",
      title: "Sossusvlei",
      location: "Salt pan in Namibia",
      image: "images/Sossusvlei.jpg",
      price: 124)
];
List<TabBarModel> popular = [
  TabBarModel(
      title: "Dubai",description: "",
      location: "United Arab Emirates",
      image: "images/607d0368488549e7b9179724b0db4940.jpg",
      price: 756),
  TabBarModel(description: "",
      title: "Cancún",
      location: "Mexico",
      image:
          "images/22bab5ad4b9aa1027ad00a84ea7493d2c0c5e666d43d3b9413e332bdbd3f1780.jpg",
      price: 321),
  TabBarModel(description: "",
      title: "Crete",
      location: "Greece",
      image: "images/shutterstock_436817194.jpg",
      price: 340),
];
