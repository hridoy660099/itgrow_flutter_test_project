import 'package:itgrow_flutter_test_project/data/data_source/trades_data_source.dart';
import 'package:itgrow_flutter_test_project/domain/repositories/trades_repository.dart';

class TradesRepositoryImpl extends TradesRepository{
  final TradesDataSource _tradesDataSource;
  TradesRepositoryImpl(this._tradesDataSource);

  // all trades
  @override
  Future getTrades(String data) async{
    return _tradesDataSource.getTrades(data);
  }
}