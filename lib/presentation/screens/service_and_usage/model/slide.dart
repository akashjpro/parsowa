import 'package:flutter/material.dart';

class Slide {
  final String imageUrl;
  final String title;
  final String description;
  final String textButton;

  Slide({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.textButton,
  });
}

final slideList = [
  Slide(
      imageUrl: 'assets/images/image1.jpg',
      title: '自由な時間で、働きたい時に',
      description: '働きたい時間に働くことができ、マップからの検索も可能です。',
      textButton: '利用規約'),
  Slide(
      imageUrl: 'assets/images/image2.jpg',
      title: '自由な時間で、働きたい時に',
      description: '働きたい時間に働くことができ、マップからの検索も可能です。',
      textButton: 'プライバシーポリシー'),
  Slide(
      imageUrl: 'assets/images/image3.jpg',
      title: '自由な時間で、働きたい時に',
      description: '働きたい時間に働くことができ、マップからの検索も可能です。',
      textButton: '同意してはじめる'),
  Slide(
      imageUrl: 'assets/images/image3.jpg',
      title: '自由な時間で、働きたい時に',
      description: '働きたい時間に働くことができ、マップからの検索も可能です。',
      textButton: '終了する'),
];
