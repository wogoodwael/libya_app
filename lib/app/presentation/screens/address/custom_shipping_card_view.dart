import 'package:flutter/material.dart';
import '../../../core/utils/app_color.dart';

class CustomShippingCardView extends StatelessWidget {
  final String title;
  final String body;
  final void Function()? onDelete;
  final void Function()? onEdit;
  const CustomShippingCardView({super.key, required this.title, required this.body, this.onDelete, this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: onDelete,
              child: const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Icon(
                  Icons.delete,
                  size: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                    fontFamily: 'ArabicUIDisplayBold',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: darkGreen),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: onEdit,
              child: Image.asset(
                "assets/images/edit.png",
                width: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
              Text(
                body,
                maxLines: null,
              ),
            ),
          ],
        ),
        const Divider(
          thickness: 2,
          color: darkGreen,
          endIndent: 10,
          indent: 10,
        ),
      ],
    );
  }
}
