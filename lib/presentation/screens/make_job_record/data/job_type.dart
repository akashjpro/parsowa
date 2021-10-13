import 'package:parsowa/presentation/screens/make_job_record/data/check_box_model.dart';

class JobType {
  List<CheckBoxModel> jobTypeSelect;
  List<CheckBoxModel> changesSelect;
  bool isNonInsurenceService;
  JobType({
    required this.jobTypeSelect,
    required this.changesSelect,
    required this.isNonInsurenceService,
  });

  static final jobTypeActive = JobType(
    jobTypeSelect: <CheckBoxModel>[
      CheckBoxModel(title: '同行あり'),
    ],
    changesSelect: <CheckBoxModel>[
      CheckBoxModel(title: '延長'),
      CheckBoxModel(title: '短縮'),
      CheckBoxModel(title: 'サービス内容'),
    ],
    isNonInsurenceService: true,
  );

  static final jobTypedisActive = JobType(
    jobTypeSelect: [],
    changesSelect: [],
    isNonInsurenceService: false,
  );
}
