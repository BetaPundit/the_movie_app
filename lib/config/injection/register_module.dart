import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/utils/constants/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// Will be used for injecting third party packages
@module
abstract class RegisterModule {
  // Inject Dio
  @lazySingleton
  Dio dio() {
    return Dio(
      BaseOptions(baseUrl: Constants.baseUrl, headers: {
        HttpHeaders.authorizationHeader: "Bearer ${Constants.token}",
      }),
    )..interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          maxWidth: 120,
        ),
      );
  }
}
