import "package:http/http.dart" as http;
import "../../../api/api.dart";

Future<String> deletePaste({
  required String pasteKey,
}) async {
  
 const proxy = 'https://corsproxy.io/?';
    final uri = Uri.https('pastebin.com', '/api/api_post.php', {
      'api_dev_key': Api.primaryApiDevKey,
      'api_user_key': Api.apiUserKey,
      'api_paste_key': pasteKey,
      'api_option': 'delete',
    });

    final response = await http.post(
      Uri.parse(proxy + uri.toString()),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: uri.queryParameters,
    );


  if (response.statusCode == 200) {
    print( response.body);
    return response.body;
  } else {
    //! update this with the new exception folder
    throw Exception('API Error: ${response.statusCode}');
  }
}