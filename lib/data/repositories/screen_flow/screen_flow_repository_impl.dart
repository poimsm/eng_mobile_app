import 'package:eng_mobile_app/data/network/network.dart';
import 'package:eng_mobile_app/data/repositories/screen_flow/screen_flow_repository.dart';
import 'package:eng_mobile_app/services/auth/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

class ScreenFlowRepositoryImpl implements ScreenFlowRepository {
  final Network _network;
  final AuthService _authService;

  ScreenFlowRepositoryImpl({required network, required authService})
      : _network = network,
        _authService = authService;

  @override
  Future<void> addType(String type) async {
    if (_authService.isAuthenticated && _authService.user.screenFlow) {
      await _network.post('/screen-flow', data: {'type': type});
    }
  }
}

/// Provider used by rest of the app
final screenFlowRepositoryProvider = Provider<ScreenFlowRepository>((ref) {
  final authService = GetIt.I.get<AuthService>();
  final config = NetworkConfigWithAuthService(authService).config();

  return ScreenFlowRepositoryImpl(
      network: Network(config), authService: authService);
});
