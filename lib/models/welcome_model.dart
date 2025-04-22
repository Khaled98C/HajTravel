class WelcomeModel {
  final String title;
  final String subTitle;
  final String description;
  final String imageUrl;

  WelcomeModel({
    required this.title,
    required this.subTitle,
    required this.description,
    required this.imageUrl,
  });
}

List<WelcomeModel> welcomeComponents = [
  WelcomeModel(
    title: "مناسك",

    subTitle: "مرحبا بكم في مناسك \nدليلك الرسمي لمكة المكرمة والمدينة المنورة",
    description:
        "مناسك تعد أول منصة رسمية تتيح لك خيار التخطيط والحجز وعيش تجربة العمرة الخاصة بك. مناسك تتيح للمسافرين من جميع أنحاء العالم تنظيم وتخطيط جميع تفاصيل زيارتهم بسهولة، بدءا من التقدم بطلب الحصول على تأشيرة إلكترونية إلى حجز الفنادق والرحلات الجوية",
    imageUrl: "images/maka1.jpg",
  ),
  WelcomeModel(
    title: "مكة المكرمة",
    subTitle:"هي المدينة المقدسة الأولى لدى المسلمين \nفيها المسجد الحرام والكعبة المشرفة، \nقبلة المسلمين التي يتوجهون إليها في صلواتهم\n  وتهوي إليها أفئدتهم لأداء مناسك الحج والعمرة\n وفيها ولد أشرف الخلق، خاتم الأنبياء والمرسلين سيدنا محمد ﷺ \n"
       
   
    ,description: "خطط للحج والعمرة على طريقتك",
    imageUrl: "images/maka2.jpg",
  ),
  WelcomeModel(
    title: "المدينة المنورة",
    subTitle: "تعد إحدى الوجهات الرئيسية لملايين المسلمين حول العالم\nحيث أنَّها أول عاصمة في تاريخ الإسلام\nثاني أقدس الأماكن لدى المسلمين بعد مكة المكرمة",
    description: " اهلاً وسهلاً في ضيافة الرحمن",
    imageUrl: "images/maka3.png",
  ),
];
