import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../models/category_model.dart';
import '../reuseable_text.dart';

class UnderFindMore extends StatelessWidget {
  const UnderFindMore({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return FadeInUp(
                    delay: const Duration(milliseconds: 900),
                    child: Container(
                      margin: EdgeInsets.only(top: size.height * 0.01),
                      width: size.width,
                      height: size.height * 0.15,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categoryComponents.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            Category current = categoryComponents[index];
                            return Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(10.0),
                                  width: size.width * 0.16,
                                  height: size.height * 0.07,
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurpleAccent
                                        // ignore: deprecated_member_use
                                        .withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Image(
                                      image: AssetImage(
                                        current.image,
                                      ),
                                    ),
                                  ),
                                ),
                                AppText(
                                  text: current.name,
                                  size: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                )
                              ],
                            );
                          }),
                    ),
                  );
  }
}