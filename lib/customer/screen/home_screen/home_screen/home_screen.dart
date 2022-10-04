import 'package:blood_donation/customer/screen/home_screen/home_screen/components/image_slider_design.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../constant/size_config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          title: const Text('Home'),
          elevation: 4,
          pinned: true,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
          ],
          expandedHeight: 60,
          // flexibleSpace: FlexibleSpaceBar(
          //   background: Center(
          //     child: Container(
          //         height: 130,
          //         margin: const EdgeInsets.only(top: 70.0),
          //         padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             const Spacer(),
          //             ElevatedButton(
          //               onPressed: () {
          //                 Navigator.push(context,
          //                     MaterialPageRoute(builder: (context) {
          //                   return const BloodRequest();
          //                 }));
          //               },
          //               style: ElevatedButton.styleFrom(
          //                 padding: const EdgeInsets.all(10.0),
          //                 shape: RoundedRectangleBorder(
          //                   borderRadius:
          //                       BorderRadius.circular(8.0), // <-- Radius
          //                 ),
          //                 primary: const Color(0xFFF4F4F4),
          //               ),
          //               child: Column(
          //                 children: const [
          //                   Spacer(),
          //                   Image(
          //                     image: AssetImage(
          //                         "assets/images/icons/bloodRequest.png"),
          //                     height: 35,
          //                     width: 40.0,
          //                   ),
          //                   Spacer(),
          //                   Text(
          //                     "Request Blood",
          //                     style: TextStyle(
          //                         fontSize: 15.0,
          //                         color: Colors.black54,
          //                         fontWeight: FontWeight.w500),
          //                   ),
          //                   Spacer(),
          //                 ],
          //               ),
          //             ),
          //             const Spacer(),
          //             ElevatedButton(
          //                 onPressed: () {
          //                   Navigator.push(context,
          //                       MaterialPageRoute(builder: (context) {
          //                     return const BloodDonationForm();
          //                   }));
          //                 },
          //                 style: ElevatedButton.styleFrom(
          //                   padding: const EdgeInsets.all(10.0),
          //                   shape: RoundedRectangleBorder(
          //                     borderRadius:
          //                         BorderRadius.circular(8.0), // <-- Radius
          //                   ),
          //                   primary: const Color(0xFFF4F4F4),
          //                 ),
          //                 child: Column(
          //                   children: const [
          //                     Spacer(),
          //                     Image(
          //                       image: AssetImage(
          //                           "assets/images/icons/bloodDonor.png"),
          //                       height: 35,
          //                       width: 40.0,
          //                     ),
          //                     Spacer(),
          //                     Text(
          //                       "Donate Blood",
          //                       style: TextStyle(
          //                           fontSize: 15.0,
          //                           color: Colors.black54,
          //                           fontWeight: FontWeight.w500),
          //                     ),
          //                     Spacer(),
          //                   ],
          //                 )),
          //             const Spacer(),
          //           ],
          //         )),
          //   ),
          // ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Column(
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                //Contain Carosal
                SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        CarouselSlider(
                          items: CourosalSliderIndicator.imageSliders,
                          options: CarouselOptions(
                              autoPlay: true,
                              enlargeCenterPage: true,
                              aspectRatio: 2.0,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _current = index;
                                });
                              }),
                        ),
                        CourosalSliderIndicator(current: _current),
                      ],
                    )),
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    "Blood Camp",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 16.0),
                  ),
                ),
                SizedBox(
                  height: 240,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 5,
                          shadowColor: Theme.of(context).colorScheme.shadow,
                          margin: const EdgeInsets.only(
                              top: 10.0, bottom: 5.0, left: 15, right: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0, left: 20, right: 20, bottom: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Blood Donation Camp",
                                  maxLines: 2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(
                                          overflow: TextOverflow.ellipsis,
                                          height: 1.3),
                                ),
                                SizedBox(
                                  height: SizeConfig.blockSizeVertical! * 2,
                                ),
                                SizedBox(
                                  width: SizeConfig.blockSizeHorizontal! * 80,
                                  child: Row(
                                    children: [
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.location_on,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                                  size: 20.0,
                                                ),
                                                const SizedBox(
                                                  width: 5.0,
                                                ),
                                                Flexible(
                                                    child: Text(
                                                  "21, Vashi Kopar Khairane Road, Kalash Udyan, Sector 11, Kopar Khairane, Navi Mumbai, MH 400709",
                                                  maxLines: 5,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline5!
                                                      .copyWith(
                                                          height: 1.3,
                                                          overflow: TextOverflow
                                                              .ellipsis),
                                                )),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.call,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                                  size: 20.0,
                                                ),
                                                const SizedBox(
                                                  width: 5.0,
                                                ),
                                                Flexible(
                                                    child: Text(
                                                  "022 2779 0286",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline5!
                                                      .copyWith(
                                                          overflow: TextOverflow
                                                              .ellipsis),
                                                )),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.date_range,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                                  size: 20.0,
                                                ),
                                                const SizedBox(
                                                  width: 5.0,
                                                ),
                                                Flexible(
                                                    child: Text(
                                                  "21 June 2022",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline5!
                                                      .copyWith(
                                                          overflow: TextOverflow
                                                              .ellipsis),
                                                )),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.access_time,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                                  size: 20.0,
                                                ),
                                                const SizedBox(
                                                  width: 5.0,
                                                ),
                                                Flexible(
                                                    child: Text(
                                                  "10:30 am to 2:00 pm",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline5!
                                                      .copyWith(
                                                          overflow: TextOverflow
                                                              .ellipsis),
                                                )),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
            // const SizedBox(
            //   height: 100,
            // )
          ]),
        ),
      ],
    );
  }
}
