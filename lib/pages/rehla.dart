import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:project/models/rehlamodel.dart';
import 'package:project/widget/reuseable_text.dart';
import 'package:shape_of_view_null_safe/shape_of_view_null_safe.dart';

class Rehla extends StatefulWidget {
  const Rehla({super.key});

  @override
  State<Rehla> createState() => _RehlaState();
}

class _RehlaState extends State<Rehla> {
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
    var size = MediaQuery.of(context).size;

    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 243, 243, 243),
            body: SizedBox(
              width: size.width,
              height: size.height,
              child: PageView.builder(
                controller: pageController,
                scrollDirection: Axis.vertical,
                itemCount: rehlalist.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  RehlaModel current = rehlalist[index];
                  return SizedBox(
                    width: size.width,
                    height: size.height,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            flex: 2,
                            child: SizedBox(
                              width: size.width,
                              height: size.height * 0.4,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: size.width * 0.1,
                                  top: size.height * 0.04,
                                  right: size.width * 0.01,
                                ),
                                child: Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: FadeInRight(
                                              child: AppText(
                                                text: current.title,
                                                size: 25.sp,
                                                color: Colors.red,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: FadeInUp(
                                              delay: const Duration(
                                                milliseconds: 400,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                  top: size.height * 0.02,
                                                ),
                                                child: SizedBox(
                                                  width: size.width * 0.8,
                                                  child: AppText(
                                                    text: current.description,
                                                    size: 17.sp,
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.w200,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      //start  point
                                      Container(
                                        child: Expanded(
                                          flex: 1,
                                          child: Column(
                                            children: List.generate(
                                              rehlalist.length,
                                              (indexDots) => GestureDetector(
                                                onTap: () {
                                                  pageController.animateToPage(
                                                    indexDots,
                                                    duration: const Duration(
                                                      milliseconds: 500,
                                                    ),
                                                    curve: Curves.linear,
                                                  );
                                                },
                                                child: AnimatedContainer(
                                                  margin: EdgeInsets.only(
                                                    right: size.width * 0.01,
                                                    bottom: size.height * 0.008,
                                                  ),
                                                  width: 10,
                                                  height: index == indexDots
                                                      ? 55
                                                      : 10,
                                                  duration: const Duration(
                                                    milliseconds: 200,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      8,
                                                    ),
                                                    color: index == indexDots
                                                        ? Colors
                                                            .deepPurpleAccent
                                                        : const Color.fromARGB(
                                                            255,
                                                            193,
                                                            170,
                                                            255,
                                                          ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      //end   point
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          /// Bottom Images
                          Expanded(
                            child: FadeInUpBig(
                              duration: const Duration(milliseconds: 1200),
                              child: ShapeOfView(
                                width: size.width,
                                elevation: 4,
                                height: size.height * 0.55,
                                shape: DiagonalShape(
                                  position: DiagonalPosition.Top,
                                  direction: DiagonalDirection.Right,
                                  angle: DiagonalAngle.deg(angle: 8),
                                ),
                                child: Image(
                                  image: AssetImage(current.image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
