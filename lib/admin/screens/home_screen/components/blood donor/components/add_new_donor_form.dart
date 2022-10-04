import 'dart:convert';

import 'package:blood_donation/admin/controller/donor%20details/add%20donor/add_new_donor_bloc.dart';
import 'package:blood_donation/admin/controller/donor%20details/single%20donor/single_donor_data_bloc.dart';
import 'package:blood_donation/admin/controller/login%20and%20signup/authentication/authentication_bloc.dart';
import 'package:blood_donation/admin/data/model/donor_info/donor_data.dart';
import 'package:blood_donation/admin/screens/home_screen/components/blood%20donor/components/add_new_blood_donor_textfield.dart';
import 'package:blood_donation/constant/admin/admin_constant.dart';
import 'package:blood_donation/constant/admin/form_validation_mixin.dart';
import 'package:blood_donation/constant/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:universal_html/html.dart' as html;

class AddNewDonorForm extends StatefulWidget {
  const AddNewDonorForm({
    Key? key,
    required this.title,
    required this.purpose,
    required this.id,
  }) : super(key: key);

  final String title;
  final String purpose;
  final int id;

  @override
  State<AddNewDonorForm> createState() => _AddNewDonorFormState();
}

class _AddNewDonorFormState extends State<AddNewDonorForm>
    with FormValidationMixin {
  String? selectBloodGroup;

  String? selectGender;

  //This is for gender dropdown form
  List<String> stateData = ["Maharastra", "Kerala", "Delhi", "string"];
  String? selectState;

  //creating instance for bloc
  SingleDonorDataBloc singleDonorDataBloc = SingleDonorDataBloc();
  AddNewDonorBloc addNewDonorBloc = AddNewDonorBloc();

  DateTime selectedDate = DateTime.now();

  //creating controller for textfield
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phoneNo = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _street = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _pincode = TextEditingController();
  final TextEditingController _illnessSpecify = TextEditingController();
  final TextEditingController _donatedBloodQty = TextEditingController();
  final TextEditingController _donatedBloodDate = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String? title;
  String? purpose;
  @override
  void initState() {
    //_counter = RestorableString(json.encode(widget.navigationData));
    //  html.window.location.assign();
    // var navigationData =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    // print(navigationData);
    title = widget.title;
    purpose = widget.purpose;
    print(title);
    if (purpose == "edit") {
      singleDonorDataBloc.add(LoadSingleDonor(widget.id));
    }

    super.initState();
  }

  void setDataToField(DonorData donorData) {
    setState(() {
      _userName.text = donorData.name ?? " ";
      _email.text = donorData.email ?? " ";
      _phoneNo.text = donorData.mobile_no_1.toString();
      _age.text = donorData.age.toString();
      _street.text = donorData.current_address.toString();
      _city.text = donorData.city.toString();
      _pincode.text = donorData.pincode.toString();
      _donatedBloodDate.text = donorData.donated_blood_date.toString();
      _donatedBloodQty.text = donorData.donated_blood.toString();
      _illnessSpecify.text = donorData.illness_specify.toString();
      selectBloodGroup = donorData.blood_group ?? " ";
      selectGender = donorData.gender ?? " ";
      selectState = donorData.state ?? " ";
    });
  }

  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:
            deviceType == DeviceScreenType.mobile ? true : false,
        // leading: deviceType == DeviceScreenType.mobile
        //     ? Builder(builder: (context) {
        //         return IconButton(
        //           onPressed: () {
        //             Scaffold.of(context).openDrawer();
        //           },
        //           icon: const Icon(Icons.menu),
        //         );
        //       })
        //     : null,
        actions: deviceType == DeviceScreenType.mobile
            ? null
            : [
                TextButton.icon(
                    onPressed: () {
                      context.read<AuthenticationBloc>().add(const LoggedOut());
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    label: const Text("Logout",
                        style: TextStyle(color: Colors.white, fontSize: 16.0))),
                const SizedBox(
                  width: 10.0,
                )
              ],
        title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 32),
                child: const Text(
                  "Admin Panel",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'HelveticaNeue',
                  ),
                ),
              ),
            ]),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => singleDonorDataBloc,
          ),
          BlocProvider(
            create: (context) => addNewDonorBloc,
          ),
        ],
        child: BlocListener<AddNewDonorBloc, AddNewDonorState>(
          listener: (context1, state) {
            if (state is AddNewDonorSuccess) {
              GoRouter.of(context).push("/home/${1}");
            }
            if (state is UpdateNewDonorSuccess) {
              print("Updated asdbfjashdbf ");
              GoRouter.of(context).push("/home/${1}");
            }
            if (state is AddNewDonorFailure) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.message),
                backgroundColor: Theme.of(context).colorScheme.inverseSurface,
                dismissDirection: DismissDirection.up,
                duration: const Duration(seconds: 2),
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.only(
                    top: 20,
                    bottom: MediaQuery.of(context).size.height - 100,
                    right: SizeConfig.blockSizeHorizontal! * 20,
                    left: SizeConfig.blockSizeHorizontal! * 20),
              ));
            }
          },
          child: BlocListener<SingleDonorDataBloc, SingleDonorDataState>(
            listener: (context, state) {
              if (state is SingleDonorDataLoaded) {
                setDataToField(state.singleDonorData.data!);
              }
              if (state is SingleDonorDataFailure) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.message),
                  backgroundColor: Theme.of(context).colorScheme.inverseSurface,
                  dismissDirection: DismissDirection.up,
                  duration: const Duration(seconds: 2),
                  behavior: SnackBarBehavior.floating,
                  margin: EdgeInsets.only(
                      top: 20,
                      bottom: MediaQuery.of(context).size.height - 100,
                      right: SizeConfig.blockSizeHorizontal! * 20,
                      left: SizeConfig.blockSizeHorizontal! * 20),
                ));
              }
            },
            child: BlocBuilder<AddNewDonorBloc, AddNewDonorState>(
              builder: (context, state) {
                if (state is AddNewDonorLoading) {
                  return ListView(
                    children: [
                      SizedBox(
                        height: SizeConfig.blockSizeVertical! * 40,
                      ),
                      const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 5,
                        ),
                      ),
                    ],
                  );
                }
                return ListView(
                  children: [
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          title ?? " ",
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Spacer(),
                                Flexible(
                                  child: AddNewDonorTextFormField(
                                    hintText: "Name",
                                    validator: isEmpty,
                                    controller: _userName,
                                    textInputType: TextInputType.text,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Flexible(
                                  child: AddNewDonorTextFormField(
                                    hintText: "Email",
                                    validator: isEmpty,
                                    controller: _email,
                                    textInputType: TextInputType.text,
                                  ),
                                ),
                                const Spacer()
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: [
                                const Spacer(),
                                Flexible(
                                  child: AddNewDonorTextFormField(
                                    hintText: "Contact Number",
                                    validator: isEmpty,
                                    controller: _phoneNo,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(
                                        10,
                                      )
                                    ],
                                    textInputType:
                                        const TextInputType.numberWithOptions(
                                      decimal: false,
                                      signed: false,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Flexible(
                                  child: AddNewDonorTextFormField(
                                    hintText: "Age",
                                    validator: isEmpty,
                                    controller: _age,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(
                                        2,
                                      )
                                    ],
                                    textInputType:
                                        const TextInputType.numberWithOptions(
                                      decimal: false,
                                      signed: false,
                                    ),
                                  ),
                                ),
                                const Spacer()
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: [
                                const Spacer(),
                                Flexible(
                                  child: DropdownButtonFormField(
                                    // Initial Value
                                    value: selectBloodGroup,
                                    validator: dropdownEmpty,
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: const Color(0xFF000000)
                                          .withOpacity(0.54),
                                    ),
                                    style:
                                        Theme.of(context).textTheme.headline2,

                                    decoration: InputDecoration(
                                      labelText: "Blood Group",
                                      isDense: true,
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          15.0, 13.0, 15.0, 13.0),
                                      labelStyle:
                                          Theme.of(context).textTheme.headline2,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: const Color(0xFF000000)
                                                  .withOpacity(0.38)),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10.0))),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: const Color(0xFF000000)
                                                  .withOpacity(0.38)),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10.0))),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: const Color(0xFF000000)
                                                  .withOpacity(0.38)),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10.0))),
                                    ),

                                    isExpanded: true,
                                    // Array list of items
                                    items: bloodGroupList.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectBloodGroup = newValue;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Flexible(
                                  child: DropdownButtonFormField(
                                    // Initial Value
                                    value: selectGender,
                                    validator: dropdownEmpty,

                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: const Color(0xFF000000)
                                          .withOpacity(0.54),
                                    ),
                                    style:
                                        Theme.of(context).textTheme.headline2,

                                    decoration: InputDecoration(
                                      labelText: "Gender",
                                      isDense: true,
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          15.0, 13.0, 15.0, 13.0),
                                      labelStyle:
                                          Theme.of(context).textTheme.headline2,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: const Color(0xFF000000)
                                                  .withOpacity(0.38)),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10.0))),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: const Color(0xFF000000)
                                                  .withOpacity(0.38)),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10.0))),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: const Color(0xFF000000)
                                                  .withOpacity(0.38)),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10.0))),
                                    ),

                                    isExpanded: true,
                                    // Array list of items
                                    items: genderList.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectGender = newValue;
                                      });
                                    },
                                  ),
                                ),
                                const Spacer()
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: [
                                const Spacer(),
                                Expanded(
                                  flex: 2,
                                  child: AddNewDonorTextFormField(
                                    hintText: "Current Address",
                                    controller: _street,
                                    validator: isEmpty,
                                    textInputType: TextInputType.text,
                                  ),
                                ),
                                const Spacer()
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: [
                                const Spacer(),
                                Flexible(
                                  child: DropdownButtonFormField(
                                    // Initial Value
                                    value: selectState,
                                    validator: dropdownEmpty,

                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: const Color(0xFF000000)
                                          .withOpacity(0.54),
                                    ),
                                    style:
                                        Theme.of(context).textTheme.headline2,

                                    decoration: InputDecoration(
                                      labelText: "State",
                                      isDense: true,
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          15.0, 13.0, 15.0, 13.0),
                                      labelStyle:
                                          Theme.of(context).textTheme.headline2,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: const Color(0xFF000000)
                                                  .withOpacity(0.38)),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10.0))),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: const Color(0xFF000000)
                                                  .withOpacity(0.38)),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10.0))),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: const Color(0xFF000000)
                                                  .withOpacity(0.38)),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10.0))),
                                    ),

                                    isExpanded: true,
                                    // Array list of items
                                    items: stateData.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectState = newValue;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Flexible(
                                  child: AddNewDonorTextFormField(
                                    validator: isEmpty,
                                    hintText: "City",
                                    controller: _city,
                                    textInputType: TextInputType.text,
                                  ),
                                ),
                                const Spacer()
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: [
                                const Spacer(),
                                Flexible(
                                  child: AddNewDonorTextFormField(
                                    validator: isEmpty,
                                    hintText: "Pin Code",
                                    controller: _pincode,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(
                                        10,
                                      )
                                    ],
                                    textInputType:
                                        const TextInputType.numberWithOptions(
                                      decimal: false,
                                      signed: false,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Flexible(
                                  child: AddNewDonorTextFormField(
                                    controller: _illnessSpecify,
                                    hintText: "Illness Specify",
                                    textInputType: TextInputType.text,
                                  ),
                                ),
                                const Spacer()
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: [
                                const Spacer(),
                                Flexible(
                                  child: AddNewDonorTextFormField(
                                    hintText: "Donated Blood Qty",
                                    validator: isEmpty,
                                    controller: _donatedBloodQty,
                                    textInputType: TextInputType.text,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Flexible(
                                  child: AddNewDonorTextFormField(
                                    controller: _donatedBloodDate,
                                    validator: isEmpty,
                                    readOnly: true,
                                    onTap: () {
                                      _selectDate(context);
                                    },
                                    hintText: "Donated Blood Date",
                                    textInputType: TextInputType.text,
                                  ),
                                ),
                                const Spacer()
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            (purpose == "add")
                                ? Row(
                                    children: [
                                      const Spacer(),
                                      Expanded(
                                        flex: 2,
                                        // width: SizeConfig.blockSizeHorizontal! * 40,
                                        child: SizedBox(
                                          height: 35,
                                          child: ElevatedButton(
                                              onPressed: () {
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  Map<String, dynamic>
                                                      donorData = {
                                                    "name": _userName.text,
                                                    "mobile_no_1":
                                                        _phoneNo.text,
                                                    "mobile_no_2": 0,
                                                    "current_address":
                                                        _street.text,
                                                    "pincode": _pincode.text,
                                                    "city": _city.text,
                                                    "state": selectState,
                                                    "blood_group":
                                                        selectBloodGroup,
                                                    "job_business_city": " ",
                                                    "job_business_state": "",
                                                    "job_business_pin": 0,
                                                    "illness_specify":
                                                        _illnessSpecify.text,
                                                    "donated_blood":
                                                        _donatedBloodQty.text,
                                                    "donated_blood_date":
                                                        _donatedBloodDate.text,
                                                    "blood_donation_card":
                                                        "string",
                                                    "donated_b_b_name":
                                                        "string",
                                                    "email": _email.text,
                                                    "gender": selectGender,
                                                    "age": _age.text
                                                  };
                                                  addNewDonorBloc.add(
                                                      AddNewDonor(donorData));
                                                }
                                              },
                                              child: const Text(
                                                "Submit",
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    color: Colors.white),
                                              )),
                                        ),
                                      ),
                                      const Spacer()
                                    ],
                                  )
                                : Row(
                                    children: [
                                      const Spacer(),
                                      Expanded(
                                        flex: 2,
                                        // width: SizeConfig.blockSizeHorizontal! * 40,
                                        child: SizedBox(
                                          height: 35,
                                          child: ElevatedButton(
                                              onPressed: () {
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  Map<String, dynamic>
                                                      donorData = {
                                                    "id": widget.id,
                                                    "name": _userName.text,
                                                    "mobile_no_1":
                                                        _phoneNo.text,
                                                    "mobile_no_2": 0,
                                                    "current_address":
                                                        _street.text,
                                                    "pincode": _pincode.text,
                                                    "city": _city.text,
                                                    "state": selectState,
                                                    "blood_group":
                                                        selectBloodGroup,
                                                    "job_business_city": " ",
                                                    "job_business_state": "",
                                                    "job_business_pin": 0,
                                                    "illness_specify":
                                                        _illnessSpecify.text,
                                                    "donated_blood":
                                                        _donatedBloodQty.text,
                                                    "donated_blood_date":
                                                        _donatedBloodDate.text,
                                                    "blood_donation_card":
                                                        "string",
                                                    "donated_b_b_name":
                                                        "string",
                                                    "email": _email.text,
                                                    "gender": selectGender,
                                                    "age": _age.text
                                                  };
                                                  addNewDonorBloc.add(
                                                      UpdateNewDonor(
                                                          donorData));
                                                }
                                              },
                                              child: const Text(
                                                "Update",
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    color: Colors.white),
                                              )),
                                        ),
                                      ),
                                      const Spacer()
                                    ],
                                  )
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1970, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      DateTime picketDataWithTime = DateTime(
          picked.year,
          picked.month,
          picked.day,
          selectedDate.hour,
          selectedDate.minute,
          selectedDate.second);
      print(picketDataWithTime);
      setState(() {
        _donatedBloodDate.text =
            DateFormat("yyyy-MM-dd H:m:s").format(picketDataWithTime);
      });
    }
  }
}
