import 'package:blood_donation/constant/size_config.dart';
import 'package:blood_donation/customer/screen/blood_request/components/request_textfield_.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BloodRequest extends StatefulWidget {
  const BloodRequest({Key? key}) : super(key: key);

  @override
  State<BloodRequest> createState() => _BloodRequestState();
}

class _BloodRequestState extends State<BloodRequest> {
  final List<String> bloodType = [
    "A+",
    "A-",
    "B+",
    "B-",
    "AB+",
    "AB-",
    "O+",
    "O-"
  ];

  String? selectedBloodType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blood Request"),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal! * 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 3,
              ),
              const RequestTextFormField(
                textInputType: TextInputType.name,
                obscureText: false,
                readOnly: true,
                label: "Patient Name",
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 3,
              ),
              const RequestTextFormField(
                textInputType: TextInputType.name,
                obscureText: false,
                readOnly: true,
                label: "Contact Person Name",
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 3,
              ),
              const RequestTextFormField(
                textInputType: TextInputType.name,
                obscureText: false,
                readOnly: true,
                label: "Contact Person Mobile Number",
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 3,
              ),
              const RequestTextFormField(
                textInputType: TextInputType.name,
                obscureText: false,
                readOnly: true,
                label: "Hospital Name",
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 3,
              ),
              const RequestTextFormField(
                textInputType: TextInputType.name,
                obscureText: false,
                readOnly: true,
                label: "Hospital Number",
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 3,
              ),
              Container(
                width: double.infinity,
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
                        "Hospital Address",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical! * 2,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Wrap(spacing: 10.0, runSpacing: 12.0, children: [
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
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 3,
              ),
              Container(
                  width: double.infinity,
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
                          "Blood Type",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical! * 2,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Wrap(
                          spacing: 10.0,
                          runSpacing: 12.0,
                          children: bloodType.map((e) {
                            return ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  selectedBloodType = e;
                                });
                              },
                              child: Text(e,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  )),
                              style: ElevatedButton.styleFrom(
                                  primary: (selectedBloodType == e)
                                      ? Theme.of(context).colorScheme.primary
                                      : Theme.of(context)
                                          .colorScheme
                                          .background,
                                  onPrimary: (selectedBloodType == e)
                                      ? Theme.of(context).colorScheme.onPrimary
                                      : Theme.of(context)
                                          .colorScheme
                                          .onBackground),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical! * 2,
                      ),
                    ],
                  )),
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 3,
              ),
              RequestTextFormField(
                  textInputType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  label: "Required Blood Quantity",
                  obscureText: false,
                  readOnly: true),
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 3,
              ),
              TextFormField(
                keyboardType: TextInputType.multiline,
                style: TextStyle(
                  fontSize: 16.0,
                  color: const Color(0xFF000000).withOpacity(0.6),
                ),
                maxLines: 5,
                minLines: 1,
                decoration: const InputDecoration(
                  labelText: "Reason For Blood Request",
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 11.0, horizontal: 12),
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 3,
              ),
              SizedBox(
                width: double.infinity,
                height: 40.0,
                child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      "Send",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 3,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
