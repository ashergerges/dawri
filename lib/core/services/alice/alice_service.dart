import 'package:dawri/core/router/app_router.dart';
import 'package:alice/alice.dart';
import 'package:alice/model/alice_configuration.dart';
import 'package:alice_dio/alice_dio_adapter.dart';
import 'package:injectable/injectable.dart';
import 'package:dawri/main_common.dart';


@singleton
class AliceService {
  late Alice _alice;
  late AliceDioAdapter _aliceDioAdapter;

  Alice get alice => _alice;

  AliceDioAdapter get aliceDioAdapter => _aliceDioAdapter;

  void initializeAlice() {
    _alice = Alice(
      configuration: AliceConfiguration(
        navigatorKey: getIt<AppRouter>().navigatorKey,
        showNotification: false,
        showShareButton: false,
        showInspectorOnShake: true,
      ),
    );

    _aliceDioAdapter = AliceDioAdapter();
    _alice.addAdapter(_aliceDioAdapter);
  }
}
