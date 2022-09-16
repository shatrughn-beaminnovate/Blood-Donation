import 'package:flutter/material.dart';

typedef RatingChangeCallback = void Function(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback? onRatingChanged;
  final Color? color;
  final double? size;

  const StarRating(
      {Key? key,
      this.starCount = 5,
      this.rating = .0,
      this.onRatingChanged,
      this.size,
      this.color})
      : super(key: key);

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon =  Icon(
        Icons.star_border,
        size: size,
        color: const Color(0xFFD9D9D9),
      );
    } else if (index > rating - 1 && index < rating) {
      icon =  Icon(
        Icons.star_half,
        size: size,
        color: const Color(0xFFFFCA22),
      );
    } else {
      icon =  Icon(
        Icons.star,
         size: size,
        color: const Color(0xFFFFCA22),
      );
    }
    return InkResponse(
      onTap:
          onRatingChanged == null ? null : () => onRatingChanged!(index + 1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:
            List.generate(starCount, (index) => buildStar(context, index)));
  }
}
