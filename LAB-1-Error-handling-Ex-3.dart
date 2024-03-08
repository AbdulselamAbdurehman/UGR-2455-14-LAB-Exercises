import 'dart:io';

void main() async {
  try {
    var config = File('junk.txt');
    var stringContents = await config.readAsString();
    print(stringContents);
  } on FileSystemException {
    print('There was a problem reading the file');
  }
}
