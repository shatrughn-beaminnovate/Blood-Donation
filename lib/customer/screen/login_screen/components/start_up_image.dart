import 'package:blood_donation/constant/size_config.dart';
import 'package:flutter/material.dart';

class StartUpImage extends StatelessWidget {
  const StartUpImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        height: SizeConfig.blockSizeVertical! * 30,
        width: SizeConfig.blockSizeHorizontal! * 70,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/bloodSignInImage.png"),
          ),
        ),
      ),
    );
  }
}
