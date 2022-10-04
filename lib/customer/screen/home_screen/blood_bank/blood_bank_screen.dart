import 'package:blood_donation/customer/screen/home_screen/blood_bank/blood_bank_details.dart';
import 'package:flutter/material.dart';

import '../../../../constant/size_config.dart';
import '../components/start_rating.dart';

class BloodBankScreen extends StatefulWidget {
  const BloodBankScreen({Key? key}) : super(key: key);

  @override
  State<BloodBankScreen> createState() => _BloodBankScreenState();
}

class _BloodBankScreenState extends State<BloodBankScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverAppBar(
          title: Text('Blood Bank'),
          pinned: true,
          elevation: 4,
          expandedHeight: 60,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((
            BuildContext context,
            int index,
          ) {
            return Card(
              elevation: 5,
              shadowColor: Theme.of(context).colorScheme.shadow,
              margin: EdgeInsets.only(
                  top: 10.0,
                  left: SizeConfig.blockSizeHorizontal! * 8,
                  right: SizeConfig.blockSizeHorizontal! * 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const BloodBankDetails();
                  }));
                },
                borderRadius: BorderRadius.circular(8.0),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, left: 20, right: 20, bottom: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "SADGURU CHARITABLE BLOODBANK",
                        maxLines: 2,
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            overflow: TextOverflow.ellipsis, height: 1.3),
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical! * 2,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      size: 20.0,
                                    ),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    Flexible(
                                        child: Text(
                                      "21, Vashi Kopar Khairane Road, Kalash Udyan, Sector 11, Kopar Khairane, Navi Mumbai, MH 400709",
                                      maxLines: 1,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .copyWith(
                                              overflow: TextOverflow.ellipsis),
                                    )),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.call,
                                      color:
                                          Theme.of(context).colorScheme.primary,
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
                                              overflow: TextOverflow.ellipsis),
                                    )),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  width: SizeConfig.blockSizeHorizontal! * 40,
                                  child: const StarRating(
                                    rating: 3.5,
                                    size: 20,
                                    // onRatingChanged: (rating) => setState(() => this.rating = rating),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Container(
                            width: 65,
                            height: 65,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage("assets/images/blood.jpeg"),
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical! * 1,
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          OutlinedButton.icon(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.location_pin,
                                size: 20.0,
                              ),
                              style: ElevatedButton.styleFrom(
                                //primary: Theme.of(context).colorScheme.primary,
                                onPrimary:
                                    Theme.of(context).colorScheme.primary,
                                side: BorderSide(
                                    width: 2.0,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              label: const Text(
                                "Get Directions",
                                style: TextStyle(fontSize: 13.0),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }, childCount: 5),
        ),
      ],
    );
  }
}
