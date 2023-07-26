class AppUrls{
  //base
  static const baseUrl = "https://peanut.ifxdb.com/api/";

  // Authenticate user
  static const authTokenEndpoint = "${baseUrl}ClientCabinetBasic/IsAccountCredentialsCorrect";

  // Profile
  static const accountInformationEndpoint = "${baseUrl}ClientCabinetBasic/GetAccountInformation";
  static const phoneNoEndpoint = "${baseUrl}ClientCabinetBasic/GetLastFourNumbersPhone";

  // Trades
  static const tradesEndpoint = "${baseUrl}ClientCabinetBasic/GetOpenTrades";
}