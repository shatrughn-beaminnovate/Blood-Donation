import 'package:blood_donation/constant/size_config.dart';
import 'package:blood_donation/customer/screen/blood_request/components/request_textfield_.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';

import '../../controller/image_upload/image_upload_show_bloc.dart';

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

  //For File Uploading
  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  String? selectedBloodType;

  //creating instace for bloc
  ImageUploadShowBloc imageUploadShowBloc = ImageUploadShowBloc();

  //Image and video picker from gallery and camera
  final ImagePicker _picker = ImagePicker();

  String? filePath;
  String? fileName;
  String? fileTag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blood Request"),
      ),
      body: BlocProvider(
        create: (context) => imageUploadShowBloc,
        child: SafeArea(
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
                                    backgroundColor: (selectedBloodType == e)
                                        ? Theme.of(context).colorScheme.primary
                                        : Theme.of(context)
                                            .colorScheme
                                            .background,
                                    foregroundColor: (selectedBloodType == e)
                                        ? Theme.of(context)
                                            .colorScheme
                                            .onPrimary
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
                  height: SizeConfig.blockSizeVertical! * 2,
                ),
                //Image Preview
                BlocBuilder<ImageUploadShowBloc, ImageUploadShowState>(
                  builder: (context, state) {
                    if (state is ImageUploadShowLoaded) {
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Icon(
                          Icons.image_rounded,
                          size: 40.0,
                          color: Colors.black.withOpacity(0.6),
                        ),
                        horizontalTitleGap: 10,
                        subtitle: InkWell(
                          onTap: () async {
                            // ignore: unused_local_variable
                            final _result =
                                await OpenFile.open(state.imagePath);
                          },
                          child: Text(
                            "Preview",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                height: 1.2,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                        title: Text(
                          state.imageName,
                          maxLines: 1,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: const Color(0xFF000000).withOpacity(0.6),
                              fontSize: 14.0),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            imageUploadShowBloc.add(const RemoveImageUpload());
                          },
                          highlightColor: Colors.amberAccent,
                          icon: const Icon(Icons.cancel_outlined),
                          color: const Color(0xFF000000).withOpacity(0.6),
                        ),
                      );
                    }
                    return Container();
                  },
                ),
                // SizedBox(
                //   height: SizeConfig.blockSizeVertical! * 2,
                // ),

                //Image Upload expansion panel
                Container(
                  margin: const EdgeInsets.all(1.0),
                  decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      border: Border.all(
                          color: const Color(0xFF000000).withOpacity(0.38)),
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Theme(
                    data: Theme.of(context)
                        .copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      title: Text(
                        "Upload Image",
                        style: TextStyle(
                            color: const Color(0xFF000000).withOpacity(0.6),
                            fontSize: 16.0),
                      ),
                      iconColor: const Color(0xFF000000).withOpacity(0.6),
                      childrenPadding: const EdgeInsets.all(10.0),
                      onExpansionChanged: (newState) {},
                      children: [
                        Row(
                          children: [
                            const Spacer(),
                            Column(
                              children: [
                                RoundedButtonWithIcon(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary,
                                  height: 50,
                                  width: 50,
                                  onPress: () {
                                    _pickFiles();
                                  },
                                  icon: const Icon(
                                    Icons.file_copy_rounded,
                                    color: Colors.white,
                                    size: 25.0,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text("Documents",
                                    style: Theme.of(context).textTheme.caption)
                              ],
                            ),
                            const Spacer(),
                            Column(
                              children: [
                                RoundedButtonWithIcon(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary,
                                  height: 50,
                                  width: 50,
                                  onPress: () {
                                    captureImage();
                                  },
                                  icon: const Icon(
                                    Icons.photo_camera,
                                    color: Colors.white,
                                    size: 25.0,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text("Photo",
                                    style: Theme.of(context).textTheme.caption)
                              ],
                            ),
                            const Spacer(),
                            Column(
                              children: [
                                RoundedButtonWithIcon(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary,
                                  height: 50,
                                  width: 50,
                                  onPress: () {
                                    galleryImage();
                                  },
                                  icon: const Icon(
                                    Icons.wallpaper,
                                    color: Colors.white,
                                    size: 25.0,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text("Gallery",
                                    style: Theme.of(context).textTheme.caption)
                              ],
                            ),
                            const Spacer(),
                          ],
                        ),
                      ],
                    ),
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
      ),
    );
  }

  //Camera Image capture
  Future<void> captureImage() async {
    try {
      final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

      if (photo != null) {
        imageUploadShowBloc.add(DisplayImageUpload(photo.name, photo.path));

        // Navigator.pushNamed(context, filePreviewRoute,
        //     arguments: {"fileName": fileName, "filePath": filePath});
      } else {
        Navigator.pop(context);
      }
    } catch (e) {
      // _logException(e.toString());
    }
  }

  //open document
  void _pickFiles() async {
    try {
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(type: FileType.any);

      if (result != null) {
        setState(() {
          filePath = result.files.single.path!;
          fileName = result.files.single.name;
        });
        imageUploadShowBloc.add(DisplayImageUpload(fileName!, filePath!));
        // Navigator.pushNamed(context, filePreviewRoute,
        //     arguments: {"fileName": fileName, "filePath": filePath});
      }
    } on PlatformException catch (e) {
      _logException('Unsupported operation' + e.toString());
    } catch (e) {
      _logException(e.toString());
    }
  }

  void _logException(String message) {
    _scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
    _scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  //Camera Image capture
  Future<void> galleryImage() async {
    try {
      final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
      if (photo != null) {
        imageUploadShowBloc
            .add(DisplayImageUpload(photo.name.substring(12), photo.path));

        // Navigator.pushNamed(context, filePreviewRoute,
        //     arguments: {"fileName": fileName, "filePath": filePath});
      } else {
        Navigator.pop(context);
      }
    } catch (e) {
      // _logException(e.toString());
    }
  }
}

class RoundedButtonWithIcon extends StatelessWidget {
  const RoundedButtonWithIcon(
      {Key? key,
      required this.backgroundColor,
      required this.height,
      required this.width,
      required this.onPress,
      required this.icon})
      : super(key: key);

  final Color backgroundColor;
  final Icon icon;
  final double height;
  final double width;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size(height, width), // button width and height
      child: ClipOval(
        child: Material(
          color: backgroundColor, // button color
          child: InkWell(
            // highlightColor: Colors.red,
            splashColor:
                const Color(0xFF000000).withOpacity(0.2), // splash color
            onTap: () {
              onPress();
            }, // button pressed
            child: icon,
          ),
        ),
      ),
    );
  }
}
