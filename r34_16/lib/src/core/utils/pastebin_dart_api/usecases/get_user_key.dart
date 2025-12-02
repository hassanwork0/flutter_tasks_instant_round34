
import "package:http/http.dart" as http;
import "../../../api/api.dart";

Future<String> getUserKey() async {

      const proxy = 'https://corsproxy.io/?';
    final uri = Uri.https('pastebin.com', '/api/api_login.php', {
      'api_dev_key': Api.primaryApiDevKey,
      'api_user_name': Api.username,
      'api_user_password': Api.password,
    });


    final response = await http.post(
      Uri.parse(proxy + uri.toString()),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: uri.queryParameters,
    );

  if (response.statusCode == 200) {
    // The response body IS the api_user_key.
    String userKey = response.body;
    return userKey;
  } else {

    //! update this with the new exception folder
    throw Exception(
      'Failed to get user key: ${response.statusCode} - ${response.body}',
    );
  }
}
