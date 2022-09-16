// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../../../constant/size_config.dart';

class BloodDonationForm extends StatefulWidget {
  const BloodDonationForm({Key? key}) : super(key: key);

  @override
  State<BloodDonationForm> createState() => _BloodDonationFormState();
}

class Question {
  final String? questionName;
  final String? value;
  Question({
    this.questionName,
    this.value,
  });

  @override
  String toString() => 'Question(questionName: $questionName, value: $value)';
}

class _BloodDonationFormState extends State<BloodDonationForm> {
  List<Question> donationQuestion = List.generate(10, (index) => Question());
  List<String> questionName = [
    "Do you have diabetes?",
    "Have you ever had problems with your heart or lungs?",
    "In the last 28 days do have you had COVID-19",
    "Have you ever had a positive test for the HIV/AIDS virus?",
    "Have you ever had cancer?",
    "In the last 3 months have you had a vaccination?"
  ];

  String? emailSubscribe = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blood Donate"),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockSizeHorizontal! * 8.0),
              child: Column(
                  children: questionName.map((e) {
                int index = questionName.indexOf(e);
                return Column(
                  children: [
                    SizedBox(
                      height: SizeConfig.blockSizeVertical! * 3,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).colorScheme.outline),
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, left: 20.0),
                            child: Text(
                              e,
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 10.0),
                            width: double.infinity,
                            child: Row(
                              children: [
                                Flexible(
                                  child: RadioListTile<String>(
                                    contentPadding: const EdgeInsets.all(0.0),
                                    activeColor:
                                        Theme.of(context).colorScheme.secondary,
                                    title: Text(
                                      'Yes',
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                    value: "Yes",
                                    groupValue: donationQuestion[index].value,
                                    onChanged: (String? value) {
                                      setState(() {
                                        donationQuestion[index] = Question(
                                            questionName: e, value: value);
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: SizeConfig.blockSizeVertical! * 3,
                                ),
                                Flexible(
                                  child: RadioListTile<String>(
                                    contentPadding: const EdgeInsets.all(0.0),
                                    activeColor:
                                        Theme.of(context).colorScheme.secondary,
                                    title: Text(
                                      'No',
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                    value: "No",
                                    groupValue: donationQuestion[index].value,
                                    onChanged: (String? value) {
                                      setState(() {
                                        donationQuestion[index] = Question(
                                            questionName: e, value: value);
                                      });
                                    },
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              }).toList()),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockSizeHorizontal! * 4.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    checkColor: Theme.of(context).colorScheme.onPrimary,
                    activeColor: Theme.of(context).colorScheme.primary,
                    value: (emailSubscribe == "1") ? true : false,
                    onChanged: (bool? value) {
                      setState(() {
                        if (value!) {
                          emailSubscribe = "1";
                        } else {
                          emailSubscribe = "0";
                        }
                      });
                    },
                  ),
                  Flexible(
                    child: Container(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text(
                          'By clicking, you agree to our term and condition',
                          style: Theme.of(context).textTheme.headline3,
                        )),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockSizeHorizontal! * 8.0),
              child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    "Become a donor",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
