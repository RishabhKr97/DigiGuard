import 'dart:math';

import 'package:digiguard/constants/data_constants.dart';
import 'package:digiguard/constants/ui_constants.dart';
import 'package:digiguard/data/reader/image_reader.dart';
import 'package:digiguard/model/level.dart';
import 'package:flutter/material.dart';

class LevelCompleteDialog extends StatelessWidget {
  static final _randomIndexGenerator = Random();

  final Level prevLevel;
  final Level newLevel;

  const LevelCompleteDialog({
    super.key,
    required this.prevLevel,
    required this.newLevel,
  });

  String get getLevelClearMessage {
    final greeting = DataConstants.levelCompleteGreeting.elementAt(
      _randomIndexGenerator.nextInt(DataConstants.levelCompleteGreeting.length),
    );
    return "$greeting! You cleared the ${prevLevel.name} level ";
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
          children: [
            TextSpan(
              text: getLevelClearMessage,
            ),
            const WidgetSpan(
              child: Icon(
                Icons.rocket_launch_outlined,
                color: Colors.red,
              ),
            ),
            // WidgetSpan(
            //   child: Image(
            //     height: UiConstants.levelCompletePrevLevelImageSize,
            //     image: ImageReader.getImage(prevLevel.id).image,
            //   ),
            // ),
          ],
        ),
      ),
      content: SizedBox(
        height: UiConstants.levelCompleteDialogHeight,
        child: Center(
          child: Column(
            children: [
              Container(
                width: UiConstants.levelCompleteNewLevelImageSize,
                height: UiConstants.levelCompleteNewLevelImageSize,
                margin: const EdgeInsets.only(
                  top: UiConstants.levelCompleteImageMarginSize,
                  right: UiConstants.levelCompleteImageMarginSize,
                  bottom: UiConstants.levelCompleteImageMarginSize,
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ImageReader.getImage(newLevel.id).image,
                  ),
                ),
              ),
              Text(
                "Your new rank is - ${newLevel.name}!",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 20),
              Text(
                newLevel.description,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.check_circle,
            size: UiConstants.levelCompleteNextButtonSize,
            color: Colors.green.shade900,
          ),
        ),
      ],
    );
  }
}
