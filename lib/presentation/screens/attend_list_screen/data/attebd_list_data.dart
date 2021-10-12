class AttendList {
  String officeName;
  String lastName;
  String name;
  String sex;
  String age;
  String address1;
  String address2;
  String status;
  String workDate;
  String scheduledStartTime;
  String scheduledLeaveTime;
  String startTime;
  String leaveTime;
  AttendList(
      {required this.officeName,
      required this.lastName,
      required this.name,
      required this.sex,
      required this.age,
      required this.address1,
      required this.address2,
      required this.status,
      required this.workDate,
      required this.scheduledStartTime,
      required this.scheduledLeaveTime,
      required this.startTime,
      required this.leaveTime});
  static init_data() {
    return [
      AttendList(
          officeName: '株式会社 事業所',
          lastName: '鈴木',
          name: ' 一郎様',
          sex: '男性',
          age: '70',
          address1: '東京都港区',
          address2: '高輪3丁目1',
          status: '修正済',
          workDate: '2020/01/10',
          scheduledStartTime: '10:00',
          scheduledLeaveTime: '14:00',
          startTime: '',
          leaveTime: ''),
      AttendList(
          officeName: '株式会社 事業所',
          lastName: '鈴木',
          name: ' 一郎様',
          sex: '男性',
          age: '70',
          address1: '東京都港区',
          address2: '高輪3丁目1',
          status: '修正済',
          workDate: '2020/01/10',
          scheduledStartTime: '10:00',
          scheduledLeaveTime: '14:00',
          startTime: '',
          leaveTime: ''),
      AttendList(
          officeName: '株式会社 事業所',
          lastName: '鈴木',
          name: ' 一郎様',
          sex: '男性',
          age: '70',
          address1: '東京都港区',
          address2: '高輪3丁目1',
          status: '修正済',
          workDate: '2020/01/10',
          scheduledStartTime: '10:00',
          scheduledLeaveTime: '14:00',
          startTime: '',
          leaveTime: ''),
      AttendList(
          officeName: '株式会社 事業所',
          lastName: '鈴木',
          name: ' 一郎様',
          sex: '男性',
          age: '70',
          address1: '東京都港区',
          address2: '高輪3丁目1',
          status: '修正依頼中',
          workDate: '2020/01/10',
          scheduledStartTime: '10:00',
          scheduledLeaveTime: '14:00',
          startTime: '',
          leaveTime: ''),
      AttendList(
          officeName: '株式会社 事業所',
          lastName: '鈴木',
          name: ' 一郎様',
          sex: '男性',
          age: '70',
          address1: '東京都港区',
          address2: '高輪3丁目1',
          status: '修正依頼中',
          workDate: '2020/01/10',
          scheduledStartTime: '10:00',
          scheduledLeaveTime: '14:00',
          startTime: '',
          leaveTime: ''),
      AttendList(
          officeName: '株式会社 事業所',
          lastName: '鈴木',
          name: ' 一郎様',
          sex: '男性',
          age: '70',
          address1: '東京都港区',
          address2: '高輪3丁目1',
          status: '修正依頼中',
          workDate: '2020/01/10',
          scheduledStartTime: '10:00',
          scheduledLeaveTime: '14:00',
          startTime: '',
          leaveTime: ''),
    ];
  }
}
