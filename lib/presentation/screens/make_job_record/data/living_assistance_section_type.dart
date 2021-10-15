import 'package:parsowa/presentation/screens/make_job_record/data/check_box_model.dart';

class LivingAssistance {
  static final cleaningTypeActive = <CheckBoxModel>[
    CheckBoxModel(title: '居室'),
    CheckBoxModel(title: '寝室'),
    CheckBoxModel(title: '台所'),
    CheckBoxModel(title: '卓上'),
    CheckBoxModel(title: 'トイレ'),
    CheckBoxModel(title: 'Pトイレ'),
    CheckBoxModel(title: '浴室'),
    CheckBoxModel(title: '廊下'),
    CheckBoxModel(title: '洗面所'),
    CheckBoxModel(title: '玄関'),
    CheckBoxModel(title: 'ゴミ取りまとめ'),
    CheckBoxModel(title: 'ゴミ出し'),
  ];

  static final laundryTypeActive = <CheckBoxModel>[
    CheckBoxModel(title: '洗濯'),
    CheckBoxModel(title: '干す（乾燥）'),
    CheckBoxModel(title: '取込み'),
    CheckBoxModel(title: 'たたむ'),
    CheckBoxModel(title: '収納'),
    CheckBoxModel(title: 'アイロン'),
  ];

  static final bedingCareTypeActive = <CheckBoxModel>[
    CheckBoxModel(title: 'シーツ交換'),
    CheckBoxModel(title: 'ベッドメイク'),
    CheckBoxModel(title: '布団干し'),
    CheckBoxModel(title: '布団取り込み'),
  ];

  static final clothingTypeActive = <CheckBoxModel>[
    CheckBoxModel(title: '衣類の整理'),
    CheckBoxModel(title: '衣類の補修'),
    CheckBoxModel(title: 'デイ準備'),
  ];

  static final preparingMealTypeActive = <CheckBoxModel>[
    CheckBoxModel(title: '下拵え'),
    CheckBoxModel(title: '調理'),
    CheckBoxModel(title: '配膳'),
    CheckBoxModel(title: '下膳'),
    CheckBoxModel(title: '後片付け'),
  ];

  static final otherTasksTypeActive = <CheckBoxModel>[
    CheckBoxModel(title: '日常品等の買物'),
    CheckBoxModel(title: '薬の受取り'),
  ];
}
