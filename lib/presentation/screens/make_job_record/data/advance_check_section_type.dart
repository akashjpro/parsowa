import 'package:parsowa/presentation/screens/make_job_record/data/check_box_model.dart';

class PhysicalConRecType {
  List<CheckBoxModel> physicalConRecType;

  PhysicalConRecType({
    required this.physicalConRecType,
  });

  static final physicalConRecTypeActive = PhysicalConRecType(
    physicalConRecType: <CheckBoxModel>[
      CheckBoxModel(title: '顔色'),
      CheckBoxModel(title: '発汗'),
      CheckBoxModel(title: '体温'),
      CheckBoxModel(title: '血圧'),
    ],
  );

  static final precheckTypeActive = [
    CheckBoxModel(title: '環境整備'),
    CheckBoxModel(title: '相談援助、情報収集・提供、  記録など'),
  ];
}
