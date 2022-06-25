import 'package:dio/dio.dart';
import 'package:sv_rms_mobile/app/session_handler.dart';
import 'package:universal_platform/universal_platform.dart';

class DioClientProvider {
  DioClientProvider({
    required String baseUrl,
    required SessionHandler sessionHandler,
  })  : _baseUrl = baseUrl,
        _sessionHandler = sessionHandler {
    _createClient();
  }

  final String _baseUrl;

  final SessionHandler _sessionHandler;

  late final Dio dio;

  Dio _createClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        sendTimeout: const Duration(seconds: 10).inMilliseconds,
        connectTimeout: const Duration(seconds: 10).inMilliseconds,
        receiveTimeout: const Duration(seconds: 10).inMilliseconds,
      ),
    );
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // ignore: deprecated_member_use
        dio.interceptors.requestLock.lock();
        _sessionHandler.getToken().then((value) {
          if (value != null) {
            options.headers['authorization'] = value;
          }
          options.headers['User-Agent'] =
              UniversalPlatform.isAndroid ? 'android' : 'ios';
        }).whenComplete(() {
          // ignore: deprecated_member_use
          dio.interceptors.requestLock.unlock();
          handler.next(options);
        });
      },
    ));
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        request: true,
      ),
    );
    return dio;
  }
}
