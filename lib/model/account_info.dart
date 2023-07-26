class AccountInfo {
  Map<String, dynamic>? extensionData; // Make it nullable by adding '?'
  String address;
  double balance;
  String city;
  String country;
  int currency;
  int currentTradesCount;
  double currentTradesVolume;
  double equity;
  double freeMargin;
  bool isAnyOpenTrades;
  bool isSwapFree;
  int leverage;
  String name;
  String phone;
  int totalTradesCount;
  double totalTradesVolume;
  int type;
  int verificationLevel;
  String zipCode;

  AccountInfo({
    this.extensionData, // Make it nullable here as well
    required this.address,
    required this.balance,
    required this.city,
    required this.country,
    required this.currency,
    required this.currentTradesCount,
    required this.currentTradesVolume,
    required this.equity,
    required this.freeMargin,
    required this.isAnyOpenTrades,
    required this.isSwapFree,
    required this.leverage,
    required this.name,
    required this.phone,
    required this.totalTradesCount,
    required this.totalTradesVolume,
    required this.type,
    required this.verificationLevel,
    required this.zipCode,
  });

  factory AccountInfo.fromJson(Map<String, dynamic> json) {
    return AccountInfo(
      extensionData: json['extensionData'],
      address: json['address'],
      balance: json['balance'],
      city: json['city'],
      country: json['country'],
      currency: json['currency'],
      currentTradesCount: json['currentTradesCount'],
      currentTradesVolume: json['currentTradesVolume'],
      equity: json['equity'],
      freeMargin: json['freeMargin'],
      isAnyOpenTrades: json['isAnyOpenTrades'],
      isSwapFree: json['isSwapFree'],
      leverage: json['leverage'],
      name: json['name'],
      phone: json['phone'],
      totalTradesCount: json['totalTradesCount'],
      totalTradesVolume: json['totalTradesVolume'],
      type: json['type'],
      verificationLevel: json['verificationLevel'],
      zipCode: json['zipCode'],
    );
  }
}
