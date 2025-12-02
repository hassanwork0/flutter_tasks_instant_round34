import "../constants/expire_dates.dart";
import "../entites/paste.dart";
import "../usecases/list_all_pastes.dart";
import "../usecases/show_paste.dart";

Future<List<Paste>> searchPaste({required String search}) async {
  List<Paste> pastes = [];

  String httpPastes = await listUserPastes();
  httpPastes = httpPastes.replaceAll('<paste>', '');
  httpPastes = httpPastes.replaceAll('</paste>', '#!,');
  List<String> pastesList = httpPastes.trim().split('#!,');

  for (var element in pastesList) {
    if (element.toLowerCase().contains(search.toLowerCase())) {
      String pasteKey = element.substring(
        element.indexOf('<paste_key>') + '<paste_key>'.length,
        element.indexOf('</paste_key>'),
      );
      String pasteTitle = element.substring(
        element.indexOf('<paste_title>') + '<paste_title>'.length,
        element.indexOf('</paste_title>'),
      );
      String pastePrivacy = element.substring(
        element.indexOf('<paste_private>') + '<paste_private>'.length,
        element.indexOf('</paste_private>'),
      );
      String pasteExpireDates = ExpireDates.never;

      String pasteFormat = element.substring(
        element.indexOf('<paste_format_short>') + '<paste_format_short>'.length,
        element.indexOf('</paste_format_short>'),
      );

      String pasteBody = await showPaste(pasteKey: pasteKey);

      Paste paste = Paste(
        pasteBody: pasteBody,
        pasteKey: pasteKey,
        pasteTitle: pasteTitle,
        pastePrivacy: pastePrivacy,
        pasteExpireDates: pasteExpireDates,
        pasteFormat: pasteFormat,
      );
      pastes.add(paste);
    }
  }
  return pastes;
}
