// import 'package:animate_do/animate_do.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:project/Controller/Welcompagecontroller.dart';

// import 'package:shape_of_view_null_safe/shape_of_view_null_safe.dart';

// import '../widget/reuseable_text.dart';
// import '../models/welcome_model.dart';

// class WelcomePage extends StatefulWidget {
//   const WelcomePage({super.key});

//   @override
//   State<WelcomePage> createState() => _WelcomePageState();
// }

// class _WelcomePageState extends State<WelcomePage> {
//   late final PageController pageController;

//   @override
//   void initState() {
//     pageController = PageController();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {

//     ControllerWelcompage controller = Get.put(ControllerWelcompage());

//     var size = MediaQuery.of(context).size;

//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: const Color.fromARGB(255, 243, 243, 243),
//         body: SizedBox(
//           width: size.width,
//           height: size.height,
//           child: PageView.builder(
//             controller: pageController,
//             scrollDirection: Axis.vertical,
//             itemCount: welcomeComponents.length,
//             physics: const BouncingScrollPhysics(),
//             itemBuilder: (context, index) {
//               WelcomeModel current = welcomeComponents[index];
//               return SizedBox(
//                  width: size.width,
//                 height: size.height,
//                 child:  Container(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                      Expanded(flex: 2,
//                        child: SizedBox(
//                           width: size.width,
//                           height: size.height * 0.4,
//                           child: Padding(
//                             padding: EdgeInsets.only(
//                               left: size.width * 0.1,
//                               top: size.height * 0.04,
//                               right: size.width * 0.01,
//                             ),
//                             child: Expanded(
//                               flex: 2,
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Expanded(
//                                         child: FadeInRight(
//                                           child: AppText(
//                                             text: current.title,
//                                             size: 20
//                                           .sp,
//                                             color: Colors.red,
//                                             fontWeight: FontWeight.w500,
//                                           ),
//                                         ),
//                                       ),
//                                       Expanded(
//                                         child: FadeInLeft(
//                                           child: AppText(
//                                             text: current.subTitle,
//                                             size: 11.sp
//                                                                           ,
//                                             color: Colors.black,
//                                             fontWeight: FontWeight.w300,
//                                           ),
//                                         ),
//                                       ),
//                                       Expanded(
//                                         child: FadeInUp(
//                                           delay: const Duration(milliseconds: 400),
//                                           child: Padding(
//                                             padding: EdgeInsets.only(
//                                               top: size.height * 0.02,
//                                             ),
//                                             child: SizedBox(
//                                               width: size.width * 0.8,
//                                               child: AppText(
//                                                 text: current.description,
//                                                size: 11.sp,
//                                                 color: Colors.grey,
//                                                 fontWeight: FontWeight.w200,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),

//                                       //Lets go button
//                                       FittedBox(fit: BoxFit.scaleDown,
//                                         child: Container(
//                                           child: FadeInUpBig(
//                                             duration: const Duration(milliseconds: 1100),
//                                             child: Padding(
//                                               padding: EdgeInsets.only(
//                                                 top: size.height * 0.08,
//                                               ),
//                                               child: MaterialButton(
//                                                 shape: RoundedRectangleBorder(
//                                                   borderRadius: BorderRadius.circular(15),
//                                                 ),

//                                                 color: Colors.deepPurpleAccent,
//                                                 onPressed: (){
//                                                   controller.goto();
//                                                 },
//                                                 child: AppText(
//                                                   text: "Let's Go",
//                                                   size: 16.sp,
//                                                   color: Colors.white,
//                                                   fontWeight: FontWeight.w300,
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       ////End Button
//                                     ],
//                                   ),

//                                   //start  point
//                                   Container(
//                                     child: Expanded(flex: 1,
//                                       child: Column(
//                                         children: List.generate(
//                                           3,
//                                           (indexDots) => GestureDetector(
//                                             onTap: () {
//                                               pageController.animateToPage(
//                                                 indexDots,
//                                                 duration: const Duration(
//                                                   milliseconds: 500,
//                                                 ),
//                                                 curve: Curves.linear,
//                                               );
//                                             },
//                                             child: AnimatedContainer(
//                                               margin: EdgeInsets.only(
//                                                 right: size.width * 0.01,
//                                                 bottom: size.height * 0.008,
//                                               ),
//                                               width: 10,
//                                               height: index == indexDots ? 55 : 10,
//                                               duration: const Duration(milliseconds: 200),
//                                               decoration: BoxDecoration(
//                                                 borderRadius: BorderRadius.circular(8),
//                                                 color:
//                                                     index == indexDots
//                                                         ? Colors.deepPurpleAccent
//                                                         : const Color.fromARGB(
//                                                           255,
//                                                           193,
//                                                           170,
//                                                           255,
//                                                         ),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),

//                                   //end   point
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                      ),

//                       /// Bottom Images
//                       Expanded(
//                         child: FadeInUpBig(
//                           duration: const Duration(milliseconds: 1200),
//                           child: ShapeOfView(
//                             width: size.width,
//                             elevation: 4,
//                             height: size.height * 0.55,
//                             shape: DiagonalShape(
//                               position: DiagonalPosition.Top,
//                               direction: DiagonalDirection.Right,
//                               angle: DiagonalAngle.deg(angle: 8),
//                             ),
//                             child: Image(
//                               image: AssetImage(current.imageUrl),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project/Controller/Welcompagecontroller.dart';
import 'package:shape_of_view_null_safe/shape_of_view_null_safe.dart';
import '../widget/reuseable_text.dart';
import '../models/welcome_model.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late final PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ControllerWelcompage controller = Get.put(ControllerWelcompage());
    var size = MediaQuery.of(context).size;
    final isWeb = size.width > 800;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 243, 243, 243),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return PageView.builder(
              controller: pageController,
              scrollDirection: Axis.vertical,
              itemCount: welcomeComponents.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                WelcomeModel current = welcomeComponents[index];
                return Container(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  padding: EdgeInsets.symmetric(
                      horizontal: constraints.maxWidth * 0.05),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: constraints.maxWidth * 0.05,
                            top: constraints.maxHeight * 0.04,
                            right: constraints.maxWidth * 0.01,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: FadeInRight(
                                        child: AppText(
                                          text: current.title,
                                          size: isWeb ? 32 : 20,
                                          color: Colors.red,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: FadeInLeft(
                                        child: AppText(
                                          text: current.subTitle,
                                          size: isWeb ? 20 : 11,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: FadeInUp(
                                        delay:
                                            const Duration(milliseconds: 400),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            top: constraints.maxHeight * 0.02,
                                          ),
                                          child: SizedBox(
                                            width: constraints.maxWidth * 0.8,
                                            child: AppText(
                                              text: current.description,
                                              size: isWeb ? 18 : 11,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w200,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: FadeInUpBig(
                                        duration:
                                            const Duration(milliseconds: 1100),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            top: constraints.maxHeight * 0.08,
                                          ),
                                          child: MaterialButton(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            color: Colors.deepPurpleAccent,
                                            onPressed: () {
                                              controller.goto();
                                            },
                                            child: AppText(
                                              text: "Let's Go",
                                              size: isWeb ? 20 : 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    3,
                                    (indexDots) => GestureDetector(
                                      onTap: () {
                                        pageController.animateToPage(
                                          indexDots,
                                          duration:
                                              const Duration(milliseconds: 500),
                                          curve: Curves.linear,
                                        );
                                      },
                                      child: AnimatedContainer(
                                        margin: EdgeInsets.only(
                                          right: constraints.maxWidth * 0.01,
                                          bottom: constraints.maxHeight * 0.008,
                                        ),
                                        width: 10,
                                        height: index == indexDots ? 55 : 10,
                                        duration:
                                            const Duration(milliseconds: 200),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: index == indexDots
                                              ? Colors.deepPurpleAccent
                                              : const Color.fromARGB(
                                                  255, 193, 170, 255),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: FadeInUpBig(
                          duration: const Duration(milliseconds: 1200),
                          child: ShapeOfView(
                            width: double.maxFinite,
                            height: double.maxFinite,
                            elevation: 4,
                            shape: DiagonalShape(
                              position: DiagonalPosition.Top,
                              direction: DiagonalDirection.Right,
                              //     angle: DiagonalAngle.deg(angle: 8),
                            ),
                            child: Image(
                                image: AssetImage(current.imageUrl),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
