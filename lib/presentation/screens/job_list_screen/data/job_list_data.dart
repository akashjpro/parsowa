class JobData {
  String title;
  String userInformation;
  String nameOfUser;
  String workLocation;
  String careLevel;
  List<String> careCategory;
  List<String> serviceClass;
  String jobDescription;
  String startDate;
  String endDate;
  String workingDay;
  String workingHours;
  String caution;
  String whatToBring;
  String referenceDocument;
  String remuneration;
  String hourlyPrice;
  List<String> tagList;
  String officeName;
  String providerName;
  String providerMail;
  String providerAddress;
  List<String> providerHowToAcsess;
  JobData({
    required this.title,
    required this.userInformation,
    required this.nameOfUser,
    required this.workLocation,
    required this.careLevel,
    required this.careCategory,
    required this.serviceClass,
    required this.jobDescription,
    required this.startDate,
    required this.endDate,
    required this.workingDay,
    required this.workingHours,
    required this.caution,
    required this.whatToBring,
    required this.referenceDocument,
    required this.remuneration,
    required this.hourlyPrice,
    required this.tagList,
    required this.officeName,
    required this.providerName,
    required this.providerMail,
    required this.providerAddress,
    required this.providerHowToAcsess,
  });
  static List<JobData> initData() {
    List<JobData> datas = [
      JobData(
          title: '''短時間の作業でも大丈夫です！\n初心者大歓迎！起床の介助と食事の介助をお願いします。''',
          userInformation: '男性/70代',
          nameOfUser: '田中太郎さん',
          workLocation: '東京都港区高輪',
          careLevel: '要支援１',
          careCategory: ['障害福祉サービス（居宅介護）'],
          serviceClass: ['身体・生活'],
          jobDescription: 'A.Aさんの入浴時の補助、住まいから近いスーパーにて買い物をお願いいたします。',
          startDate: '2021/9/1(水)',
          endDate: '2021/10/31(日)',
          workingDay: '月/火/水/木/金/土/日',
          workingHours: '10:00～12:00',
          caution: '過去に、お風呂での転倒があり骨折をしております。入浴の際は慎重にお願いいたします。',
          whatToBring: '筆記用具、メモ帳など',
          referenceDocument: '参考資料.pdf',
          remuneration: '3,400',
          hourlyPrice: '1,100',
          tagList: ['介護保険', '身体', '起床・就寝', '午前', '時間要相談', '交通費支給'],
          officeName: '株式会社 事業所',
          providerName: 'セレケア',
          providerMail: 'aaaabbbb@hikesiya.co.jp',
          providerAddress: '東京都目黒区○○2-5-5○○ビル',
          providerHowToAcsess: ['目黒駅から徒歩20分', '中目黒駅から徒歩10分']),
      JobData(
          title: '短時間の作業でも大丈夫です！\n初心者大歓迎！起床の介助と食事の…',
          userInformation: '男性/70代',
          nameOfUser: '田中太郎さん',
          workLocation: '東京都港区高輪',
          careLevel: '要支援１',
          careCategory: ['障害福祉サービス（居宅介護）'],
          serviceClass: ['身体・生活'],
          jobDescription: 'A.Aさんの入浴時の補助、住まいから近いスーパーにて買い物をお願いいたします。',
          startDate: '2021/9/1(水)',
          endDate: '2021/10/31(日)',
          workingDay: '月/火/水/木/金/土/日',
          workingHours: '10:00～12:00',
          caution: '過去に、お風呂での転倒があり骨折をしております。入浴の際は慎重にお願いいたします。',
          whatToBring: '筆記用具、メモ帳など',
          referenceDocument: '参考資料.pdf',
          remuneration: '3,400',
          hourlyPrice: '1,100',
          tagList: ['介護保険', '身体', '起床・就寝', '午前', '時間要相談', '交通費支給'],
          officeName: '株式会社 事業所',
          providerName: 'セレケア',
          providerMail: 'aaaabbbb@hikesiya.co.jp',
          providerAddress: '東京都目黒区○○2-5-5○○ビル',
          providerHowToAcsess: ['目黒駅から徒歩20分', '中目黒駅から徒歩10分']),
      JobData(
          title: '短時間の作業でも大丈夫です！\n初心者大歓迎！起床の介助と食事の…',
          userInformation: '男性/70代',
          nameOfUser: '田中太郎さん',
          workLocation: '東京都港区高輪',
          careLevel: '要支援１',
          careCategory: ['障害福祉サービス（居宅介護）'],
          serviceClass: ['身体・生活'],
          jobDescription: 'A.Aさんの入浴時の補助、住まいから近いスーパーにて買い物をお願いいたします。',
          startDate: '2021/9/1(水)',
          endDate: '2021/10/31(日)',
          workingDay: '月/火/水/木/金/土/日',
          workingHours: '10:00～12:00',
          caution: '過去に、お風呂での転倒があり骨折をしております。入浴の際は慎重にお願いいたします。',
          whatToBring: '筆記用具、メモ帳など',
          referenceDocument: '参考資料.pdf',
          remuneration: '3,400',
          hourlyPrice: '1,100',
          tagList: ['介護保険', '身体', '起床・就寝', '午前', '時間要相談', '交通費支給'],
          officeName: '株式会社 事業所',
          providerName: 'セレケア',
          providerMail: 'aaaabbbb@hikesiya.co.jp',
          providerAddress: '東京都目黒区○○2-5-5○○ビル',
          providerHowToAcsess: ['目黒駅から徒歩20分', '中目黒駅から徒歩10分']),
    ];
    return datas;
  }
}
