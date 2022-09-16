import 'package:blood_donation/customer/screen/blood_request/components/request_textfield_.dart';
import 'package:blood_donation/customer/screen/home_screen/profile/components/profile_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../../constant/size_config.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          title: const Text('Profile'),
          pinned: true,
          elevation: 4,
          actions: [
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.save,
                  color: Colors.white,
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                label: Text(
                  "Save",
                  style: TextStyle(
                    fontSize: 17.0,
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                )),
            const SizedBox(
              width: 5.0,
            )
          ],
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 3,
            ),
            Center(
              child: ProfileTextFormField(
                width: SizeConfig.blockSizeHorizontal! * 80,
                textInputType: TextInputType.name,
                obscureText: false,
                readOnly: true,
                label: "Name",
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 3,
            ),
            Center(
              child: ProfileTextFormField(
                width: SizeConfig.blockSizeHorizontal! * 80,
                textInputType: TextInputType.name,
                obscureText: false,
                readOnly: true,
                label: "Email",
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 3,
            ),
            Center(
              child: ProfileTextFormField(
                width: SizeConfig.blockSizeHorizontal! * 80,
                textInputType: TextInputType.name,
                obscureText: false,
                readOnly: true,
                label: "Contact Number",
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 3,
            ),
            Center(
              child: ProfileTextFormField(
                width: SizeConfig.blockSizeHorizontal! * 80,
                textInputType: TextInputType.name,
                obscureText: false,
                readOnly: true,
                label: "Age",
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 3,
            ),
            Center(
              child: ProfileTextFormField(
                width: SizeConfig.blockSizeHorizontal! * 80,
                textInputType: TextInputType.name,
                obscureText: false,
                readOnly: true,
                label: "Gender",
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 3,
            ),
            Center(
              child: Container(
                width: SizeConfig.blockSizeHorizontal! * 80,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).colorScheme.outline),
                    borderRadius: BorderRadius.circular(8.0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, left: 12.0),
                      child: Text(
                        "Current Address",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical! * 2,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Wrap(
                          spacing: SizeConfig.blockSizeHorizontal! * 3,
                          runSpacing: 12.0,
                          children: [
                            ProfileTextFormField(
                              width: SizeConfig.blockSizeHorizontal! * 73,
                              textInputType: TextInputType.name,
                              obscureText: false,
                              readOnly: true,
                              label: "Street",
                            ),
                            RequestTextFormField(
                                width: SizeConfig.blockSizeHorizontal! * 35,
                                textInputType: TextInputType.name,
                                label: "State",
                                obscureText: false,
                                readOnly: true),
                            RequestTextFormField(
                                width: SizeConfig.blockSizeHorizontal! * 35,
                                textInputType: TextInputType.name,
                                label: "City",
                                obscureText: false,
                                readOnly: true),
                            RequestTextFormField(
                                width: SizeConfig.blockSizeHorizontal! * 35,
                                textInputType: TextInputType.name,
                                label: "Landmark",
                                obscureText: false,
                                readOnly: true),
                            RequestTextFormField(
                                width: SizeConfig.blockSizeHorizontal! * 35,
                                textInputType: TextInputType.name,
                                label: "Pin Code",
                                obscureText: false,
                                readOnly: true)
                          ]),
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical! * 2,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 3,
            ),
            Center(
              child: ProfileTextFormField(
                width: SizeConfig.blockSizeHorizontal! * 80,
                textInputType: TextInputType.name,
                obscureText: false,
                readOnly: true,
                label: "Blood Group",
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 3,
            ),
          ]),
        ),
      ],
    );
  }
}
