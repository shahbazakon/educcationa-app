import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../utils/local_storage.dart';
import 'error_handler.dart';

class APIService {
  final ErrorHandling _errorHandling = ErrorHandling();

  showLoading(BuildContext context) {
    Dialog alert = const Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      barrierColor: Colors.white.withOpacity(0),
      builder: (BuildContext context) {
        return SizedBox(child: alert);
      },
    );
  }

  Future<dynamic> post({
    required BuildContext context,
    required Map<String, dynamic> requestedData,
    required bool isAuthenticated,
    required String url,
    bool? showAlert,
    bool? showLoader,
  }) async {
    // if (showLoader ?? false) {
    //   showLoading(context);
    // }

    try {
      log("requestedData - ${jsonEncode(requestedData)}");
      var response = await http.post(
        Uri.parse(url),
        headers: await _getHeaders(isAuthenticated: isAuthenticated),
        body: json.encode(requestedData),
      );
      // if (showLoader ?? false) {
      //   if (context.owner != null) {
      //     Navigator.of(context).pop(); // Error on this line
      //   }
      // }
      log("API URL: $url");
      log("HTTP Status Code: ${response.statusCode}");
      log("Response: ${response.body}");

      if (response.statusCode == 503 || response.statusCode == 502) {
        // TODO : Add DologBox
        BotToast.showText(text: "Site is under maintenance");
        return;
      }

      /// If the Token is invalid
      if (response.statusCode == 744 || response.statusCode == 401) {
        // TODO : Add DologBox
        BotToast.showText(text: "Please login again. Session Expired.");
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => const Text("Please login again. Session Expired."),
        );
        return;
      }
      var _response = json.decode(response.body);

      if (response.statusCode == HttpStatus.ok) {
        if (showAlert == null || showAlert == true) {
          log("showAlert");
          var code = _response["APIResponseCode"];
          if (code != 0) {
            // log("Error Response: ${_response["Response"]}");
            // showToast("${_response["APIResponseMessage"]}");
            BotToast.showText(
                text: code == 500
                    ? "Please Try Again Later"
                    : _response["APIResponseMessage"] ?? "Please try again, later");
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => Text(code == 500
                  ? "Please Try Again Later"
                  : _response["APIResponseMessage"] ?? "Please try again, later"),
            );
            return;
          }
        }

        return _response;
      } else {
        log("$url POST response is NOT OK:${response.statusCode}");
        log(" will 1111 logout");
        BotToast.showText(text: response.statusCode.toString());
        if (response.statusCode == 401) {
          log(" will logout   int");
          logout(context);
        }
        if (response.statusCode.toString() == "401") {
          log(" will logout");
          logout(context);
        }
        if (response.statusCode.toString() == "404") {
          // BotToast.showText(text: ErrorResponse.fromJson(json.decode(response.body)).message);
        }
        if (response.statusCode.toString() == "403") {
          // BotToast.showText(text: ErrorResponse.fromJson(json.decode(response.body)).message);
        }
        // {"success":false,"message":"Incorrect Otp"}
        var _response = json.decode(response.body);
        log("_response - ${_response['error']}");
        if (_response["error"] != null && _response["error"].runtimeType == String) {
          throw json.decode(response.body);
        }
      }
    } on SocketException {
      _errorHandling.showErrorDialogue(context, "Network Error", "Check your internet connection");
      if (showLoader ?? false) {
        Navigator.pop(context);
      }
    } catch (e) {
      log("Exception thrown: $e");
      rethrow;
    }
  }

  Future<dynamic> getData(
      {required BuildContext context, required String url, required bool isAuthenticated}) async {
    try {
      log("URL: $url");
      var headers = await _getHeaders(isAuthenticated: isAuthenticated);
      var response = await http.get(
        Uri.parse(url),
        headers: headers,
      );
      if (response.statusCode == HttpStatus.ok) {
        var _response = json.decode(response.body);
        return _response;
      } else {
        log("$url GET response is NOT OK:${response.statusCode}");
        if (response.statusCode.toString() == "401") {
          log("will log out now${response.statusCode}");
          logout(context);
        }
        throw json.decode(response.body);
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<dynamic> put({
    context,
    required Map<String, dynamic> requestedData,
    required bool isAuthenticated,
    required String url,
  }) async {
    try {
      // log("requestedData - $requestedData");
      var response = await http.put(
        Uri.parse(url),
        headers: await _getHeaders(isAuthenticated: isAuthenticated),
        body: json.encode(requestedData),
      );
      if (response.statusCode == HttpStatus.ok) {
        var _response = json.decode(response.body);
        return _response;
      } else {
        log("$url PUT response is NOT OK:" + response.statusCode.toString());
        if (response.statusCode.toString() == "401") {
          logout(context);
        }
        var _response = json.decode(response.body);
        log("_response - ${_response['error']}");
        if (_response["error"] != null && _response["error"].runtimeType == String)
          throw json.decode(response.body);
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<dynamic> deleteData(
      {required BuildContext context, required String url, required bool isAuthenticated}) async {
    try {
      log(url);
      var headers = await _getHeaders(isAuthenticated: isAuthenticated);
      var response = await http.delete(
        Uri.parse(url),
        headers: headers,
      );
      if (response.statusCode == HttpStatus.ok) {
        var _response = json.decode(response.body);
        return _response;
      } else {
        log("$url GET response is NOT OK:" + response.statusCode.toString());
        if (response.statusCode.toString() == "401") {
          log("will log out now" + response.statusCode.toString());
          logout(context);
        }
        throw json.decode(response.body);
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }

  logout(BuildContext context) async {
    LocalStorage.prefs?.setBool("isLogIn", false);
    LocalStorage.clearLocal();
    // Navigator.of(context).pushAndRemoveUntil(
    //   // the new route
    //   MaterialPageRoute(
    //     builder: (BuildContext context) =>  SignInScreen(),
    //   ),
    //   (Route route) => false,
    // );
  }

  Future<Map<String, String>> _getHeaders({required bool isAuthenticated}) async {
    Map<String, String> headers = {
      "ApiKey": "pgH7QzFHJx4w46fI~5Uzi4RvtTwlEXp",
      "content-type": "application/json",
      "Accept": "application/json",
    };
    if (isAuthenticated) {
      String? token = await LocalStorage.getPreferencesValue(LocalStorage.token);
      // TODO need to remove this else blockn
      // token =
      //     "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjMzMTk3NTE4NTAiLCJuYmYiOjE2NTUwOTk5NjgsImV4cCI6MTY1NTM1MTk2OCwiaWF0IjoxNjU1MDk5OTY4fQ.IgxHg057Db3H3NaC1-K2ZwKsrxREAmy8xm0vnyRMDkI";
      log("token is:$token");
      if (token != null) {
        headers.addAll({"Authorization": token});
        return headers;
      }
    }
    // log("=======headers========$headers");
    return headers;
  }
}
