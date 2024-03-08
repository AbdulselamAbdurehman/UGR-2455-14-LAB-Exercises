import 'dart:io';
import 'package:http/http.dart' as http;

Future<void> downloadFile(String url, String savePath) async {
  try {
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var file = File(savePath);
      await file.writeAsBytes(response.bodyBytes);
      print('Download completed.');
    } else {
      print('There was a Problem');
    }
  } catch (e) {
    print('Error while downloading file: $e');
  }
}

void main() {
  final url = 'http://example.com/dart.png'; // URL of the file to download
  final savePath = 'dart.png'; // Path where the downloaded file will be saved

  downloadFile(url, savePath);
}
