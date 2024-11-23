import '../constants/app/app_settings.dart';

/// API
class APIUrls {
  APIUrls._();

  /// Domain url
  static const BASE_URL = AppSettings.BASE_URL;
  static const BASE_JSON_PLACEHOLDER = "https://jsonplaceholder.typicode.com/";

  /// Urls
  static const API_JP_COMMENTS = "comments";
  static const API_NOTIFICATIONS = "Customer/Notification/MyNotifications";
  static const API_CHANGE_NOTIFICATION_STATUS =
      "Customer/Account/TurnOnOrOffNotifications";
  static const ADD_OR_UPDATE_FIRBASE_TOKEN =
      "services/app/DeviceTokenService/AddOrUpdateFireBaseToken";
  static const REPORT_PROBLEM = "Customer/AuditLog/ReportError";

  // City
  static const API_CITY_DETAILS = "Customer/City/Details";
  static const API_CITY_LIST = "Customer/City/List";
  static const API_CITY_SEARCH = "Customer/City/Search";
}
