import 'package:flutter/material.dart';

enum ButtonType { TermsOfService, PrivacyPolicy, AgreeAndStart, Finish }

class Slide {
  final String imageUrl;
  final String title;
  final String description;
  final ButtonType typeButton;

  Slide({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.typeButton,
  });
}

// TODO: Update image //////////////////////////////////////////////////////////

final slideList = [
  Slide(
      imageUrl: 'assets/images/image1.jpg',
      title: '自由な時間で、働きたい時に',
      description: '働きたい時間に働くことができ、マップからの検索も可能です。',
      typeButton: ButtonType.TermsOfService),
  Slide(
      imageUrl: 'assets/images/image2.jpg',
      title: '自由な時間で、働きたい時に',
      description: '働きたい時間に働くことができ、マップからの検索も可能です。',
      typeButton: ButtonType.PrivacyPolicy),
  Slide(
      imageUrl: 'assets/images/image3.jpg',
      title: '自由な時間で、働きたい時に',
      description: '働きたい時間に働くことができ、マップからの検索も可能です。',
      typeButton: ButtonType.AgreeAndStart),
  Slide(
      imageUrl: 'assets/images/image3.jpg',
      title: '自由な時間で、働きたい時に',
      description: '働きたい時間に働くことができ、マップからの検索も可能です。',
      typeButton: ButtonType.Finish),
];
