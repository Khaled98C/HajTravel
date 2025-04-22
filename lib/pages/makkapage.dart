import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class MakkahPage extends StatelessWidget {
  const MakkahPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderSection(),
              const WhyMakkahSection(),
              const LandmarksSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
         
        Image.asset(
          'images/2a.png',
          width: double.infinity,
          height: 300,
          fit: BoxFit.cover,
        ),
        Image.asset(
          'images/2a.png',
          width: double.infinity,
          height: 300,
          fit: BoxFit.cover,
        ),
        Container(
          width: double.infinity,
          height: 300,
          color: Colors.black.withOpacity(0.1),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: Text(
            'مكة المكرمة',
            style: GoogleFonts.cairo(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
          Positioned(top: 50,
            child: InkWell(
                onTap: () {
                  print("tap");
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back_ios_sharp,
                  size: 35,
                )),
          ),
      ],
    );
  }
}

class WhyMakkahSection extends StatelessWidget {
  const WhyMakkahSection({super.key});

  @override
  Widget build(BuildContext context) {
    final reasons = [
      {'title': 'الروحانية', 'image': 'images/1a.png'},
      {'title': 'العمارة الإسلامية', 'image': 'images/7a.png'},
      {'title': 'التاريخ الإسلامي', 'image': 'images/12a.png'},
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'لماذا مكة؟',
            style: GoogleFonts.cairo(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            "هي المدينة المقدسة الأولى لدى المسلمين، فيها المسجد الحرام والكعبة المشرفة، قبلة المسلمين التي يتوجهون إليها في صلواتهم، وتهوي إليها أفئدتهم لأداء مناسك الحج والعمرة، وفيها ولد أشرف الخلق، خاتم الأنبياء والمرسلين سيدنا محمد ﷺ، وانطلقت منها رسالة الإسلام السمحاء إلى جميع بقاع الأرض بعدما نزل بها القرآن الكريم. تقع مكة المكرمة غربي المملكة العربية السعودية، وشهدت في عهد ملوك المملكة اهتمامًا عظيمًا، وما زال الاعتناء بها مستمرًا لتقديم أفضل الخدمات لضيوف الرحمن، كما شهد أبرز معالمها المسجد الحرام، الكثير من التوسعات التي شملت كل أجزاء المسجد، وحظيت المشاعر المقدسة بمجموعة من الأعمال التطويرية، لتوفير كل سبل الراحة والاطمئنان لجميع الحجاج والمعتمرين من داخل المملكة وخارجها",
            style:
                GoogleFonts.cairo(fontSize: 15, fontWeight: FontWeight.normal),
          ),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 2.5,
            ),
            itemCount: reasons.length,
            itemBuilder: (context, index) {
              final item = reasons[index];
              return Card(
                elevation: 4,
                child: Row(
                  children: [
                    Image.asset(item['image']!, width: 120, fit: BoxFit.cover),
                    const SizedBox(width: 16),
                    Text(
                      item['title']!,
                      style: GoogleFonts.cairo(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class LandmarksSection extends StatelessWidget {
  const LandmarksSection({super.key});

  @override
  Widget build(BuildContext context) {
    final landmarks = [
      {
        'title': 'المسجد الحرام',
        'image': 'images/swrt_ryysyt_1_1_1_915f0ac60d.jpeg'
      },
      {'title': 'جبل النور', 'image': 'images/jbl.jfif'},
      {'title': 'غار حراء', 'image': 'images/hra.jfif'},
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'المعالم',
            style: GoogleFonts.cairo(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: landmarks.length,
              itemBuilder: (context, index) {
                final item = landmarks[index];
                return Container(
                  width: 160,
                  margin: const EdgeInsets.only(right: 12),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          item['image']!,
                          width: 160,
                          height: 140,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item['title']!,
                        style: GoogleFonts.cairo(
                            fontSize: 16, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
