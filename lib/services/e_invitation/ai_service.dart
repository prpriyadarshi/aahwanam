import 'package:http/http.dart' as http;
import 'dart:convert';

class AIService {
  static const String apiKey = 'YOUR_OPENAI_API_KEY';
  static const String endpoint = 'https://api.openai.com/v1/completions';

  static Future<String> generateBirthdayMessage(String name) async {
    final response = await http.post(
      Uri.parse(endpoint),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: json.encode({
        'model': 'text-davinci-003',
        'prompt': 'Write a joyful birthday message for $name.',
        'max_tokens': 50,
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['choices'][0]['text'].trim();
    } else {
      throw Exception('Failed to generate message');
    }
  }
}
