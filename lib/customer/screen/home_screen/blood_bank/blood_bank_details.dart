import 'package:flutter/material.dart';

import '../../../../constant/size_config.dart';
import '../components/start_rating.dart';

class BloodBankDetails extends StatefulWidget {
  const BloodBankDetails({Key? key}) : super(key: key);

  @override
  State<BloodBankDetails> createState() => _BloodBankDetailsState();
}

class _BloodBankDetailsState extends State<BloodBankDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 220.0,
            floating: true,
            pinned: true,
            snap: true,
            elevation: 4,
            backgroundColor: Theme.of(context).colorScheme.primary,
            flexibleSpace: FlexibleSpaceBar(
                //  centerTitle: true,
                title: const Text(
                  'Blood Bank Details',
                ),
                background: Image.asset(
                  'assets/images/testBloodBank.jpeg',
                  fit: BoxFit.cover,
                )),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0.0),
              child: Text(
                "SADGURU CHARITABLE BLOODBANK",
                maxLines: 2,
                style: Theme.of(context).textTheme.headline3!.copyWith(
                    overflow: TextOverflow.ellipsis,
                    height: 1.3,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 5.0, 20, 0.0),
                width: SizeConfig.blockSizeHorizontal! * 40,
                child: const StarRating(
                  rating: 3.5,
                  size: 20,
                  // onRatingChanged: (rating) => setState(() => this.rating = rating),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10.0, 20, 0.0),
              child: Row(
                children: [
                  Icon(
                    Icons.call,
                    color: Theme.of(context).colorScheme.primary,
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
                        .copyWith(overflow: TextOverflow.ellipsis),
                  )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10.0, 20, 0.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.location_on,
                    color: Theme.of(context).colorScheme.primary,
                    size: 20.0,
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Flexible(
                      child: Text(
                    "21, Vashi Kopar Khairane Road, Kalash Udyan, Sector 11, Kopar Khairane, Navi Mumbai, MH 400709",
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(height: 1.5),
                  )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10.0, 20, 0.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 5.0,
                  ),
                  Flexible(
                      child: Text(
                    "Open 24 hours",
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(height: 1.5),
                  )),
                ],
              ),
            ),
          ])),
        ],
      ),
    );
  }
}
