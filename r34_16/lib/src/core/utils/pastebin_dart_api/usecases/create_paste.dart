import "package:http/http.dart" as http;
import "../../../api/api.dart";

Future<String> createPaste({
  required String paste,
  String? apiPasteTitle,
  String? apiPasteFormat,
  String? apiPastePrivacy,
  String? apiPasteExpirationDate,
  String? apiFolderKey,
}) async {

    const proxy = 'https://corsproxy.io/?';
    final uri = Uri.https('pastebin.com', '/api/api_raw.php', {
      'api_dev_key': Api.primaryApiDevKey,
      'api_paste_code': paste,
      'api_option': 'paste',
      'api_user_key': Api.apiUserKey,
      'api_paste_name': apiPasteTitle ?? '',
      'api_paste_format': apiPasteFormat ?? '',
      'api_paste_private': apiPastePrivacy ?? '',
      'api_paste_expire_date': apiPasteExpirationDate ?? '',
      'api_folder_key': apiFolderKey ?? '',
    });

    final response = await http.post(
      Uri.parse(proxy + uri.toString()),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: uri.queryParameters,
    );


  if (response.statusCode == 200) {
    print(response.body);
    return response.body;
  } else {
    //! update this with the new exception folder
    throw Exception('API Error: ${response.statusCode}');
  }
}
