import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../pages/PlacesPage.dart';

class Dlilk extends StatelessWidget {
  final void Function()? onTap;
  final String title;
 Dlilk({ Key? key, required this.onTap, required this.title }) : super(key: key);

  @override
  Widget build(BuildContext context){
    
       var size = MediaQuery.of(context).size;
    return  Card(
                        shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
                        child: ClipRRect(   borderRadius:
                          const BorderRadius.all( Radius.circular(20)),
                          child: Container(
                          height: size.height * 0.12,
                          width: size.width * 0.35,
                          child: FadeInUp(
                              child: InkWell(
                            onTap: onTap,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    //     color: Colors.black.withOpacity(0.1),
                                    child: SvgPicture.asset(
                                      "images/mnask.svg",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Expanded(child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(title),
                                ))
                              ],
                            ),
                          )),
                        ),
                        ),
                      );
  }
}