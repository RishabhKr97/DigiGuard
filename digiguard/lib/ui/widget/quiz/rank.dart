import 'package:digiguard/constants/ui_constants.dart';
import 'package:digiguard/data/reader/image_reader.dart';
import 'package:digiguard/model/level.dart';
import 'package:flutter/material.dart';

class Rank extends StatelessWidget {
  final Level level;

  const Rank(this.level, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: UiConstants.quizLevelImageSize,
            height: UiConstants.quizLevelImageSize,
            margin: const EdgeInsets.only(
              top: UiConstants.quizLevelImageMarginSize,
              right: UiConstants.quizLevelImageMarginSize,
              bottom: UiConstants.quizLevelImageMarginSize,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ImageReader.getImage(level.id).image,
              ),
            ),
          ),
          Text(level.name),
        ],
      ),
    );
  }
}
