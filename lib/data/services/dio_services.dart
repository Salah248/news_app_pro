import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app_pro/data/model/news_model.dart';
import 'package:news_app_pro/resources/sencetive_data.dart';

class DioServices {
  final Dio? dio;
  DioServices()
    : dio = Dio(
        BaseOptions(
          baseUrl: SensitiveData.baseUrl,
          receiveTimeout: const Duration(milliseconds: 20000),
          connectTimeout: const Duration(milliseconds: 20000),
          sendTimeout: const Duration(milliseconds: 20000),
          headers: {'Content-Type': 'application/json'},
          queryParameters: {'apiKey': SensitiveData.apiKey},
        ),
      );

  Future<NewsModel?> getNews(String category) async {
    log('getNews called');
    try {
      final response = await dio!.get(
        '${SensitiveData.baseUrl}everything?q=$category&sortBy=popularity',
      );
      log('response: ${response.statusCode}');
      if (response.statusCode! <= 200 && response.statusCode! < 300) {
        final data = NewsModel.fromJson(response.data);
        log('data: ${data.articles!.first.author}');
        return data;
      } else {
        throw Exception('Failed to load news');
      }
    } on DioException catch (e) {
      log('error: $e');
    }
    return null;
  }

  Future<NewsModel?> searchNews(String query) async {
    log('searchNews called with query: $query');
    try {
      final response = await dio!.get(
        '${SensitiveData.baseUrl}everything',
        queryParameters: {
          'q': query,
          'sortBy': 'popularity',
          'apiKey': SensitiveData.apiKey,
        },
      );

      log('response: ${response.statusCode}');
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        final data = NewsModel.fromJson(response.data);
        return data;
      } else {
        throw Exception('Failed to load news');
      }
    } on DioException catch (e) {
      log('error: $e');
    }
    return null;
  }
}
