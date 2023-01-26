import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant.dart';
import 'headline_text.dart';
import 'search_field.dart';
import 'view_all_btn.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
//! firestore data fetch
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('carousel-banner-img').snapshots();
  final TextEditingController searchController = TextEditingController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          var data = snapshot.data!.docs;
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }
          if (data.isEmpty) {
            return const Text('Wait');
          }

          return SafeArea(
            child: Column(
              children: [
                const HeadlineEcommerce(text: 'Ecommerce'),
                SearchBox(
                  hintText: 'Search Product here',
                  controller: searchController,
                ),
                CarouselSlider(
                    items: List.generate(
                        data.length,
                        (index) => AspectRatio(
                            aspectRatio: 3.5,
                            child: Image.network(
                              data[index]['img'],
                              fit: BoxFit.fitWidth,
                            ))),
                    options: buildCarouselSlider(
                        initialPage: data.length,
                        height: 150.0,
                        autoPlay: true,
                        onPageChanged: (index, pageValue) {
                          setState(() {
                            currentIndex = index;
                          });
                        })),
                DotsIndicator(
                  dotsCount: data.isEmpty ? 1 : data.length,
                  position: currentIndex.toDouble(),
                  decorator: const DotsDecorator(
                    activeColor: kPrimaryColor,
                  ),
                ),
                TopProductButton(
                  topProduct: 'Top Product',
                  viewText: 'View Text',
                  onTap: () {},
                ),
                SizedBox(
                  height: 200,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        data.length,
                        (index) => Padding(
                          padding: EdgeInsets.all(kDefaultPadding.sp - 15.sp),
                          child: Column(
                            children: [
                              Container(
                                width: 130,
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.sp),
                                ),
                                child: Image.network(
                                  data[index]['img'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const Text('Hello'),
                              const Text('Hello'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  CarouselOptions buildCarouselSlider({
    required initialPage,
    required height,
    required autoPlay,
    required onPageChanged,
  }) {
    return CarouselOptions(
      height: height,
      aspectRatio: 3.5,
      viewportFraction: 0.8,
      initialPage: initialPage,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: autoPlay,
      autoPlayInterval: const Duration(seconds: 10),
      autoPlayAnimationDuration: const Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      enlargeFactor: 0.3,
      onPageChanged: onPageChanged,
      scrollDirection: Axis.horizontal,
    );
  }
}
