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
    final url = Uri.parse('https://api.deepl.com/v2/translate');

    setState(() => _isLoading = true);

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'DeepL-Auth-Key $apiKey',
        },
        body: jsonEncode({
          'text': input,
          'target_lang': targetLang,
        }),
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        setState(() {
          _translation = jsonResponse['translations'][0]['text'];
        });
      } else {
        print('Request failed with status: ${response.statusCode}.');
        print('Response body: ${response.body}');
        setState(() {
          _translation =
              'Translation failed. Status code: ${response.statusCode}';
        });
      }
    } catch (e) {
      print('Caught error: $e');
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
        title: Text('Translate Now'),
        backgroundColor: Color(0xFFC9B1FA),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Translate text from English to your target language',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: selectedLanguage,
              icon: Icon(Icons.arrow_downward),
              decoration: InputDecoration(
                labelText: "Translate to",
                filled: true,
                fillColor: Colors.blue[100],
              ),
              onChanged: (String? newValue) {
                setState(() {
                  selectedLanguage = newValue;
                });
              },
              items: targetLanguageCodes.keys.map((String language) {
                return DropdownMenuItem<String>(
                  value: language,
                  child: Text(language),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: 'Enter text here...',
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _textEditingController.clear();
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading || selectedLanguage == null
                  ? null
                  : () {
                      if (_textEditingController.text.isNotEmpty) {
                        translateText(
                          _textEditingController.text,
                          targetLanguageCodes[selectedLanguage]!,
                        );
                      }
                    },
              child:
                  _isLoading ? CircularProgressIndicator() : Text('Translate'),
            ),
            SizedBox(height: 20),
            Text(
              _translation,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFFC9B1FA),
    );
  }
}
