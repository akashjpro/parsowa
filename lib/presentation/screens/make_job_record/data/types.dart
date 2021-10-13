import 'package:flutter/material.dart';
import 'package:parsowa/presentation/screens/make_job_record/data/check_box_model.dart';

class ServiceType {
  List<CheckBoxModel> careChoices;

  ServiceType({
    required this.careChoices,
  });

  static final serviceTypeActive = ServiceType(careChoices: <CheckBoxModel>[
    CheckBoxModel(title: '身体介護中心'),
    CheckBoxModel(title: '生活援助'),
    CheckBoxModel(title: '通院等乗降解除'),
  ]);
}

class VisitType {
  List<CheckBoxModel> visitChoices;

  VisitType({
    required this.visitChoices,
  });

  static final visitTypeActive = VisitType(visitChoices: <CheckBoxModel>[
    CheckBoxModel(title: '訪問型サービス'),
    CheckBoxModel(title: '生活支援（基準緩和）サービス'),
  ]);
}

class ServiceForDisableType {
  List<CheckBoxModel> serviceForDisableTypeChoices;

  ServiceForDisableType({
    required this.serviceForDisableTypeChoices,
  });

  static final serviceForDisableTypeActive =
      ServiceForDisableType(serviceForDisableTypeChoices: <CheckBoxModel>[
    CheckBoxModel(title: '身体介護'),
    CheckBoxModel(title: '家事援助'),
    CheckBoxModel(title: '重度包括'),
    CheckBoxModel(title: '行動援護'),
    CheckBoxModel(title: '同行援護'),
    CheckBoxModel(title: '通院介助'),
  ]);
}

class ServiceForCommunityLifeType {
  List<CheckBoxModel> serviceForCommunityLifeType;
  ServiceForCommunityLifeType({
    required this.serviceForCommunityLifeType,
  });

  static final serviceForCommunityLifeTypeActive =
      ServiceForCommunityLifeType(serviceForCommunityLifeType: <CheckBoxModel>[
    CheckBoxModel(title: '移動支援'),
  ]);
}
