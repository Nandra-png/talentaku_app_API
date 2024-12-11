import 'package:flutter/material.dart';
import '../models/text_pair.dart';

class CustomTextPairWidget extends StatelessWidget {
  final CustomTextPairModel model;

  const CustomTextPairWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(model.primaryText, style: model.primaryStyle),
        Text(model.secondaryText, style: model.secondaryStyle),
      ],
    );
  }
}
