import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TranslationPage extends StatefulWidget {
  @override
  _TranslationPageState createState() => _TranslationPageState();
}

class _TranslationPageState extends State<TranslationPage> {
  final Map<String, String> targetLanguageCodes = {
    'German': 'DE',
    'Spanish': 'ES',
    'French': 'FR',
    'Italian': 'IT',
    'Japanese': 'JA',
    'Korean': 'KO',
    'Dutch': 'NL',
    'Polish': 'PL',
    'Portuguese': 'PT',
    'Russian': 'RU',
    'Chinese': 'ZH',
  };

  String? selectedLanguage;
  TextEditingController _textEditingController = TextEditingController();
  String _translation = '';
  bool _isLoading = false;

  Future<void> translateText(String input, String targetLang) async {
    final apiKey =
        '00aef7ed-014c-4dde-8d62-bfcff2d5416c:fx'; // Replace with your actual API key
    final url = Uri.parse('https://api-free.deepl.com/v2/translate');

    setState(() => _isLoading = true);

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'DeepL-Auth-Key $apiKey',
        },
        body: jsonEncode({
          'text': [input], // Adjusted to be an array
          'target_lang': targetLang,
        }),
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        setState(() {
          _translation = jsonResponse['translations'][0]['text'];
        });
      } else {
        setState(() {
          _translation =
              'Translation failed. Status code: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        _translation = 'Translation failed: $e';
      });
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Translate Now'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Choose Your Target Language',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: selectedLanguage,
              onChanged: (String? newValue) {
                setState(() {
                  selectedLanguage = newValue!;
                });
              },
              items: targetLanguageCodes.entries
                  .map<DropdownMenuItem<String>>((entry) {
                return DropdownMenuItem<String>(
                  value: entry.value,
                  child: Text(entry.key),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _textEditingController,
              decoration: const InputDecoration(
                hintText: 'Enter text here...',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading || selectedLanguage == null
                  ? null
                  : () {
                      translateText(
                          _textEditingController.text, selectedLanguage!);
                    },
              child: _isLoading
                  ? CircularProgressIndicator()
                  : const Text('Translate'),
            ),
            SizedBox(height: 20),
            Text(
              _translation,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
