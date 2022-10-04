import 'package:blood_donation/customer/screen/blood_request/components/request_textfield_.dart';
import 'package:blood_donation/customer/screen/home_screen/profile/components/profile_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../../constant/size_config.dart';

class DonorInfoForm extends StatefulWidget {
  const DonorInfoForm({Key? key}) : super(key: key);

  @override
  State<DonorInfoForm> createState() => _DonorInfoFormState();
}

class _DonorInfoFormState extends State<DonorInfoForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [],
        title: const Text("Donor Info Form"),
      ),
      body: SafeArea(
          child: ListView(
        children: [
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
                  border:
                      Border.all(color: Theme.of(context).colorScheme.outline),
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
            child: Container(
              width: SizeConfig.blockSizeHorizontal! * 80,
              decoration: BoxDecoration(
                  border:
                      Border.all(color: Theme.of(context).colorScheme.outline),
                  borderRadius: BorderRadius.circular(8.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, left: 12.0),
                    child: Text(
                      "Office Address",
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
        ],
      )),
    );
  }
}
