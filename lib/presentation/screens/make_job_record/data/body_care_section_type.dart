import 'package:flutter/material.dart';
import 'package:parsowa/presentation/screens/make_job_record/data/check_box_model.dart';

class BodyCareType {
  static final excretionAssistanceTypeActive = <CheckBoxModel>[
    CheckBoxModel(title: 'トイレ'),
    CheckBoxModel(title: 'Pトイレ'),
    CheckBoxModel(title: '尿器'),
    CheckBoxModel(title: 'パッド交換'),
    CheckBoxModel(title: 'オムツ交換'),
    CheckBoxModel(title: '尿'),
    CheckBoxModel(title: '便'),
    CheckBoxModel(title: '陰部洗浄・清拭'),
  ];

  static final mealAssistanceTypeActive = <CheckBoxModel>[
    CheckBoxModel(title: '全介助'),
    CheckBoxModel(title: '一部介助'),
    CheckBoxModel(title: '見守り'),
    CheckBoxModel(title: '水分補給'),
    CheckBoxModel(title: 'メニューの説明'),
    CheckBoxModel(title: '食事量'),
    CheckBoxModel(title: '特段の調理'),
  ];

  static final getDressedTypeActive = <CheckBoxModel>[
    CheckBoxModel(title: '清拭'),
    CheckBoxModel(title: '部分浴'),
    CheckBoxModel(title: '洗髪'),
    CheckBoxModel(title: '全身浴'),
    CheckBoxModel(title: '洗面'),
    CheckBoxModel(title: '整容'),
    CheckBoxModel(title: '口腔ケア'),
    CheckBoxModel(title: '爪切り'),
    CheckBoxModel(title: '整更衣介助容'),
  ];

  static final subGetDressedTypeActive = <CheckBoxModel>[
    CheckBoxModel(title: '手'),
    CheckBoxModel(title: '足'),
    CheckBoxModel(title: '陰部'),
    CheckBoxModel(title: '臀部'),
  ];

  static final goingOutTypeActive = <CheckBoxModel>[
    CheckBoxModel(title: '移乗・移動介助'),
    CheckBoxModel(title: '車イス'),
    CheckBoxModel(title: '通院・外出介助'),
    CheckBoxModel(title: '外出準備介助'),
    CheckBoxModel(title: '帰宅受入介助'),
    CheckBoxModel(title: '院内介助'),
  ];

  static final wakeUpOrSleepActive = <CheckBoxModel>[
    CheckBoxModel(title: '起床介助'),
    CheckBoxModel(title: '就寝介助'),
    CheckBoxModel(title: '体位変換'),
  ];

  static final takingMecOrMecPracActive = <CheckBoxModel>[
    CheckBoxModel(title: '服薬確認・介助'),
    CheckBoxModel(title: '湿布貼付'),
    CheckBoxModel(title: '軟膏塗布'),
    CheckBoxModel(title: '点眼'),
    CheckBoxModel(title: '痰の吸引'),
    CheckBoxModel(title: '経管栄養'),
  ];

  static final independenceSupportActive = <CheckBoxModel>[
    CheckBoxModel(title: '入浴・更衣・移動時等の自立への声かけと安全の見守り'),
    CheckBoxModel(title: '共に行う（掃除・調理・洗濯・衣類整理・買物'),
    CheckBoxModel(title: '体位変意欲・関心の引き出し換'),
  ];
}
