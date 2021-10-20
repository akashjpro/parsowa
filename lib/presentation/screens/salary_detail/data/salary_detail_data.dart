class SalaryDetail {
  final String provider;
  final String price;
  const SalaryDetail({required this.provider, required this.price});

  static List<SalaryDetail> initData() => [
        const SalaryDetail(provider: 'A事業所', price: '1,000'),
        const SalaryDetail(provider: 'B事業所', price: '2,000'),
        const SalaryDetail(provider: 'C事業所', price: '1,500'),
      ];
}
