class WorkDetail {
  List<String> weekDays;
  String startDate;
  String endDate;
  List<String> address;
  String workingDate; // yyyy/mm/dd
  String startTime; // hh:ss
  String endTime; // hh:ss
  WorkDetail({
    required this.weekDays,
    required this.startDate,
    required this.endDate,
    required this.address,
    required this.workingDate,
    required this.startTime,
    required this.endTime,
  });

  static final workDetail = WorkDetail(
    weekDays: ['月', '火', '水', '木', '金', '土', '日'],
    startDate: '10:00',
    endDate: '14:00',
    address: ['目黒区中目黒2-8-22', '中目黒TDビル3F'],
    workingDate: '2020/01/10',
    startTime: '10:00',
    endTime: '14:00',
  );
}
