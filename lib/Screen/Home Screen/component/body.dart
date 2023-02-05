import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import '../../../constant.dart';
import '../../Accessories Product/accessories_product.dart';
import '../../Top Product Details/details_screen.dart';
import '../../Top Products/top_products.dart';
import 'accesories_product_btn.dart';
import 'search_field.dart';
import '../../Product Card/home_product_card.dart';
import '../../Product Card/top_product_btn.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController searchController = TextEditingController();
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    fetchTopProduct();
    fetchBannerImgFromDb();
    fetchAccessoresImgFromDb();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SearchBox(
          hintText: 'Search Product here',
          controller: searchController,
        ),
        Shimmer(
          duration: const Duration(seconds: 2),
          interval: const Duration(seconds: 1),
          color: Colors.black,
          colorOpacity: 0,
          enabled: bannerSnapshot.isNotEmpty ? false : true,
          direction: const ShimmerDirection.fromLTRB(),
          child: CarouselSlider(
              items: List.generate(bannerSnapshot.length, (index) {
                return AspectRatio(
                  aspectRatio: 3.5,
                  child: Image.network(
                    bannerSnapshot[index]['img'],
                    fit: BoxFit.fitWidth,
                  ),
                );
              }),
              options: buildCarouselSlider(
                  initialPage: bannerSnapshot.length,
                  height: 150.0,
                  autoPlay: true,
                  onPageChanged: (index, pageValue) {
                    setState(() {
                      currentIndex = index;
                    });
                  })),
        ),
        DotsIndicator(
          dotsCount: bannerSnapshot.isEmpty ? 1 : bannerSnapshot.length,
          position: currentIndex.toDouble(),
          decorator: const DotsDecorator(
            activeColor: kPrimaryColor,
          ),
        ),
        TopProductButton(
          topProduct: 'Top Product',
          viewText: 'View all',
          onTap: () {
            Navigator.of(context).pushNamed(TopProducts.route);
          },
        ),
        Shimmer(
          duration: const Duration(seconds: 2),
          interval: const Duration(seconds: 1),
          color: Colors.black,
          colorOpacity: 0,
          enabled: topProductSnapshot.isNotEmpty ? false : true,
          direction: const ShimmerDirection.fromLTRB(),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                  5,
                  (index) => HomeProductCard(
                        snapshot: topProductSnapshot,
                        index: index,
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              snapShot: topProductSnapshot,
                              index: index,
                            ),
                          ));
                        },
                      )),
            ),
          ),
        ),
        AccesoriesProductButton(
            accesoriesProduct: 'Accessories',
            onTap: () {
              Navigator.of(context).pushNamed(AccessoriesProduct.route);
            },
            viewText: 'View all'),
        Shimmer(
          duration: const Duration(seconds: 2),
          interval: const Duration(seconds: 1),
          color: Colors.black,
          colorOpacity: 0,
          enabled: accessoriesSnapshot.isNotEmpty ? false : true,
          direction: const ShimmerDirection.fromLTRB(),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                5,
                (index) => HomeProductCard(
                  snapshot: accessoriesSnapshot,
                  index: index,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        snapShot: accessoriesSnapshot,
                        index: index,
                      ),
                    ));
                  },
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }

  CarouselOptions buildCarouselSlider(
      {required initialPage,
      required height,
      required autoPlay,
      required onPageChanged}) {
    return CarouselOptions(
      height: height,
      aspectRatio: 3.5,
      viewportFraction: 0.8,
      initialPage: initialPage,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: autoPlay,
      autoPlayInterval: const Duration(seconds: 4),
      autoPlayAnimationDuration: const Duration(seconds: 3),
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      enlargeFactor: 0.3,
      onPageChanged: onPageChanged,
      scrollDirection: Axis.horizontal,
    );
  }

//! firestore data fetch
  final firestore = FirebaseFirestore.instance;
  //! top product list here
  List topProductSnapshot = [];
  Future fetchTopProduct() async {
    final collection = await firestore.collection('product-items').get();
    setState(() {
      for (int i = 0; i < collection.docs.length; i++) {
        topProductSnapshot.add(
          {
            'img': collection.docs[i]['img'],
            'id': collection.docs[i]['id'],
            'name': collection.docs[i]['name'],
            'price': collection.docs[i]['price'],
            'des': collection.docs[i]['des'],
          },
        );
      }
    });
  }

//! banner product list here
  List bannerSnapshot = [];
  Future fetchBannerImgFromDb() async {
    final collection = await firestore.collection('carousel-banner-img').get();
    setState(() {
      for (int i = 0; i < collection.docs.length; i++) {
        bannerSnapshot.add(
          {
            'img': collection.docs[i]['img'],
          },
        );
      }
    });
  }

//! accessories product
  List accessoriesSnapshot = [];
  Future fetchAccessoresImgFromDb() async {
    final collection = await firestore.collection('accessories').get();
    setState(() {
      for (int i = 0; i < collection.docs.length; i++) {
        accessoriesSnapshot.add(
          {
            'img': collection.docs[i]['img'],
            'id': collection.docs[i]['id'],
            'name': collection.docs[i]['name'],
            'price': collection.docs[i]['price'],
            'des': collection.docs[i]['des'],
          },
        );
      }
    });
  }
}
