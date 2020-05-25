import 'package:gsheets/gsheets.dart';
import 'package:learn_english/core/models/lesson.dart';
import 'package:learn_english/core/models/vocabulary.dart';

class GSheetData {
// your google auth credentials
  final _credentials = r'''
{
  "type": "service_account",
  "project_id": "ferrous-depth-276306",
  "private_key_id": "f5b40d96624b4b4b26414a256a270068656b3b67",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCQs7c4sVGjBK1B\ngFUeO6Dm3Y5TRCoAeBXpFWNU1yeV7bXTyxaDFlVot6fdI5TdF4lKqW6UtEA2cNwM\nsaePdc8Y2awJB3oIRPe2yy4iUbwW/RA6UbQ3tMtmLsDdjdmjI2ziRvKx/znu67+z\nUJ+8R7sKyiymyPhs4gdn74SCVjVNMUallTL0wfOOzf/kgGEuGSWjJeitvqq35Jgd\nT3W+F/sTtNbP6j7LPU6M18abjetvF8sl6jqO1nJT9J2L49BeW6VVEuB8iVYS+tmu\ntJyB2jwijt1LZ2n9u5dJYC2y7vEKIjZPN0GWJhT9olwBHN6K1yVmBBhP+JtU+XAg\nyojPNiI7AgMBAAECggEAAjHXm5KE7HYLsqyhnd3FqPq/R+AGyw8HNgvO/+Brh0id\ns2KnKsHR9c6jSyVZAqlyuaEsPjElsC2yCLdBFVnyFCxpAZINdcamAy29u2OF+MtJ\nzbijhRzG4PvgjPuzy1ekNSJiV/TJCiilNbEJWy+zVIyQdM8jhXNALYFifx+Tm2IY\nG5JTR6oFbwrcbnowhSn6gEybfh5RrhUkC8lmMBrSgIKnxv6m9AFeUxUEh61OUHSz\n3jVaMSeVvg0zsBiEXmaXW5ECTLSeAeRSwfyVvWz/Pzg66o6SvIy1gHaq0oPUzte4\ncC9+d/aOY5vbiQigtvdmNi8UW+0ycLows8H02voSQQKBgQDBQkhnuhA1rH7HXxhZ\nOOhJ2dWEZqIOSX8NFJ5/MP/BaqU4cC7Nzhc0/ccHEjE/0TKn/Zoh3I7JwgRh1TZa\nKNEK/LWdLlLoS0Y4Kbk5ly2dcZGytnRKCAXlT9c3bN8HvWDECGudOXHhcBriBiY/\nrzzu/jpqgbKgxvp/hAV/amMgywKBgQC/reBn0cu6hQCMIt02/10+GN4YX16YNQKc\n0r/oQaGZH7+0nOrX1m8oYWRK8nuT++UNzduVN77tr5IJ7kEsUJgOtwvpwNd382cz\nNdPLejHa5rFpvDpjqZ6AvTnSbY5IawKIcxxXwOH0J3pN99SwebSxnpHoyDTi4Ucz\nEo5HerwGUQKBgDe9/ZJlmX1RxrOM20II5v8+JJbu33lNe6bzNpArOum37/XqbaWQ\n9yKivEBu3+OvXHQV8tonesv4+TiavfWdZkZMA7pVfTZhV9ylNDbHQzHxavvoInyj\n+cddkw76iQ37cqi4YQnVYuKKakadTXT6/5FTpNfJlxNGsUQMeWV58yOnAoGAFON3\n/xhn4U25P4xVGzc9DBVdrr5F6sRsInb9Hux4Fd3V4HLxTNA7kOT8Lwa53Oioj5aN\nhXdrwS9O9PIX/CJUT9Y24CR51sKZzoThLd2FLVvSnbk7i7ziXxlAAeSait3Oitww\njIeimB7tPy3w6cJ5pJmpQPsAeHEgdzpgcv23G+ECgYEAjCn1ekok/5VrGxc1T8kH\nIMHpprjrnY27oho5Bf+oq747q6EtQ6latJ31P6pwtgEg12NO4TC+J9Hx/v8iVdlk\nRB99wDWUlkPmbP9Q4G3Ou/nle5mkG/0lMd77uNNNIKDB8+Di8sDOuzLN0+cNvHAq\nWnm+gzDKanm/mfIrQ77hp1c=\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheet@ferrous-depth-276306.iam.gserviceaccount.com",
  "client_id": "103580139006689638522",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheet%40ferrous-depth-276306.iam.gserviceaccount.com"
}
''';

  final _spreadsheetId = '1cbYmzXYSHEig1WdT7p8g4YE2Y-rdrTxtOBPIRiEvZJw';

  Future<List<Vocabulary>> getVocabFromGSheet() async {
    final gsheets = GSheets(_credentials);
    final ss = await gsheets.spreadsheet(_spreadsheetId);
    var sheet = ss.worksheetByTitle('Vocabulary');
    var data = await sheet.values.allRows();
    data.removeAt(0);

    List<Vocabulary> list = [];
    data.forEach((element) {
      list.add(Vocabulary(
          vocabId: element[0],
          vocab: element[1],
          lessonId: element[2],
          mean: element[3],
          type: int.parse(element[4]),
          image: element[5],
          audioFile: element[6],
          otherWord: element[7].split('/')));
    });
    return list;
  }

  Future<List<Lesson>> getLessonFromGSheet() async {
    final gsheets = GSheets(_credentials);
    final ss = await gsheets.spreadsheet(_spreadsheetId);
    var sheet = ss.worksheetByTitle('Lesson');
    var data = await sheet.values.allRows();
    data.removeAt(0);

    List<Lesson> list = [];
    data.forEach((element) {
      list.add(Lesson(
          lessonId: element[0], lessonName: element[1], image: element[2]));
    });
    return list;
  }

}
