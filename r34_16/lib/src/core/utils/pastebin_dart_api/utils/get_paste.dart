import "../entites/paste.dart";
import "search_paste.dart";

Future<Paste> getPaste({
  required String pasteKey,
}) async {
  List<Paste> pastes = await searchPaste(
    search: pasteKey,
  );

  return pastes.firstWhere((element) => element.pasteKey == pasteKey);
}
