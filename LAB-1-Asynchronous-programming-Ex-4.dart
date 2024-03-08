import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  var result = await fetchWeather();
  var formatted = jsonDecode(result);
  var temperature = formatted['main']['temp'];
  print('The temperature is $temperature K');
}

fetchWeather() async {
  var appId = ''; //app id by signing for open weather current weather api
  var url =
      'https://api.openweathermap.org/data/2.5/weather?lat=8.980603&lon=38.757759&appid=$appId';
  var response = await http.get(Uri.parse(url));
  return response.body;
}
