// ignore_for_file: curly_braces_in_flow_control_structures, prefer_is_empty
import 'package:dio/dio.dart';

class ApiErrorHandler {
  static dynamic getMessage(error) {
    dynamic errorDescription = "";
    if (error is Exception) {
      try {
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              errorDescription = "تم إلغاء الطلب إلى خادم API";
              break;
            case DioErrorType.connectionTimeout:
              errorDescription = "يجب فحص حالة الانترنت واعادة المحاولة";
              break;
            case DioErrorType.connectionError:
              errorDescription = "فشل الاتصال بخادم API بسبب الاتصال بالإنترنت";
              break;
            case DioErrorType.receiveTimeout:
              errorDescription = "تلقي المهلة فيما يتعلق بخادم API";
              break;
            case DioErrorType.badResponse:
              switch (error.response!.statusCode) {
                case 400:
                case 401:
                case 307:
                case 403:
                case 404:
                case 500:
                case 503:
                  errorDescription = error.response!.statusMessage;
                  break;
                default:
                  errorDescription =
                      "Failed to load data - status code: ${error.response!.statusCode}";
              }
              break;
            case DioErrorType.sendTimeout:
              errorDescription = "إرسال المهلة مع الخادم";
              break;
            case DioErrorType.connectionError:
              break;
          }
        } else {
          errorDescription = "حدث خطأ غير متوقع";
        }
      } on FormatException catch (e) {
        errorDescription = e.toString();
      }
    }
    // else {
    //   errorDescription = "is not a subtype of exception";
    // }
    return errorDescription;
  }
}
