class Paste {
  final String pasteBody;
  final String pasteKey;
  final String pasteTitle;
  final String pastePrivacy;
  final String pasteExpireDates;
  final String pasteFormat;

  Paste({
    required this.pasteBody,
    required this.pasteKey,
    required this.pasteTitle,
    required this.pastePrivacy,
    required this.pasteExpireDates,
    required this.pasteFormat,
  });

  @override
  String toString() {

    return 'Paste: \n  Key: $pasteKey\n  Title: $pasteTitle\n  Privacy: $pastePrivacy\n  Expire Date: $pasteExpireDates\n  Format: $pasteFormat\n  Body: $pasteBody';
  }
}
