class User {
  String username;
  String sex;
  int age;
  User({
    required this.username,
    required this.sex,
    required this.age,
  });

  static final user = User(
    username: '鈴木太郎様',
    sex: '男性',
    age: 70,
  );
}
