class JobData {
  String title;
  String userInformation;
  String workLocation;
  String workingDay;
  String workingHours;
  String remuneration;
  List<String> tagList;
  String officeName;
  JobData({
    required this.title,
    required this.userInformation,
    required this.workLocation,
    required this.workingDay,
    required this.workingHours,
    required this.remuneration,
    required this.tagList,
    required this.officeName,
  });
  static List<JobData> initData() {
    List<JobData> datas = [
      JobData(
          title: '短時間の作業でも大丈夫です！\n初心者大歓迎！起床の介助と食事の…',
          userInformation: '男性/70代',
          workLocation: '東京都港区高輪',
          workingDay: '月/火/水/木/金/土/日',
          workingHours: '10:00～12:00',
          remuneration: '3,400',
          tagList: ['介護保険', '身体', '起床・就寝', '午前', '時間要相談', '交通費支給'],
          officeName: '株式会社 事業所'),
      JobData(
          title: '短時間の作業でも大丈夫です！\n初心者大歓迎！起床の介助と食事の…',
          userInformation: '男性/70代',
          workLocation: '東京都港区高輪',
          workingDay: '月/火/水/木/金/土/日',
          workingHours: '10:00～12:00',
          remuneration: '3,400',
          tagList: [
            '介護保険',
            '身体',
            '起床・就寝',
            '午前',
            '時間要相談',
            '交通費支給',
            '介護保険',
            '身体',
            '起床・就寝',
            '午前',
            '時間要相談',
            '交通費支給',
            '介護保険',
            '身体',
            '起床・就寝',
            '午前',
            '時間要相談',
            '交通費支給'
          ],
          officeName: '株式会社 事業所'),
      JobData(
          title: '短時間の作業でも大丈夫です！\n初心者大歓迎！起床の介助と食事の…',
          userInformation: '男性/70代',
          workLocation: '東京都港区高輪',
          workingDay: '月/火/水/木/金/土/日',
          workingHours: '10:00～12:00',
          remuneration: '3,400',
          tagList: ['介護保険', '身体', '起床・就寝', '午前', '時間要相談', '交通費支給'],
          officeName: '株式会社 事業所'),
    ];
    return datas;
  }
}
