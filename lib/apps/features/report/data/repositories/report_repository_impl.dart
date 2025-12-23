import '../../domain/repositories/report_repository.dart';
import '../datasource/report_network_datasource.dart';
import '../datasource/report_offline_datasource.dart';

class ReportRepositoryImpl implements ReportRepository {
  final ReportNetworkDatasource _network;
  final ReportOfflineDatasource _offline;

  ReportRepositoryImpl(this._network, this._offline);

  // TODO: Implement repository methods
}
