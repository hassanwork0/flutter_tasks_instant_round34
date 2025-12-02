import '../entites/paste.dart';
import '../usecases/create_paste.dart';
import '../usecases/delete_paste.dart';
import 'get_paste.dart';

Future<String> editPaste({
  required String pasteKey,
  required String newPaste,
}) async {


  //! Warning!!!! , the edit function isn't editing files 
  //! but instead it deltes the file and create new one 
  //! with the same name but diffrent body and link
  //! also all edited files will be found in the root pastes
  //! not in the folders they where created in 





  Paste paste = await getPaste(
    pasteKey: pasteKey,
  );

  String newPasteLink = await createPaste(
    paste: newPaste,
    apiPasteExpirationDate: paste.pasteExpireDates,
    apiPasteTitle: paste.pasteTitle,
    apiPastePrivacy: paste.pastePrivacy,
  );

  await deletePaste(
    pasteKey: pasteKey,
  );
  print("Edited the paste and the new link is $newPasteLink");
  return newPasteLink;
  
}
