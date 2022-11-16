// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';


import '../components/language_list_element.dart';
import '../models/language.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key, required this.title, required this.isAutomaticEnabled});

   final String title;
  final bool isAutomaticEnabled;

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  final TextEditingController _searchTextController = TextEditingController();
  final List<Language> _languageList = [
      Language('auto', 'Automatic', false, false, false),
      Language('ptbr', 'Portugues', false, false, false),
      Language('wai', 'Waiwai', false, false, false),
      Language('ts1', 'Teste1', false, false, false),
      Language('ts2', 'Teste2', false, false, false),
  ];

  @override
  void initState() {
    super.initState();

    // Remove the automatic element if disabled
    if (!widget.isAutomaticEnabled) {
      var automaticElement = _languageList
          .where((language) => language.code == 'auto')
          .toList()[0];
      _languageList.remove(automaticElement);
    }
  }

  // Send back the selected language
  _sendBackLanguage(Language language) {
    Navigator.pop(context, language);
  }

  // Display the delete text icon if we typed text in the search input
  Widget? _displayDeleteTextIcon() {
    if (_searchTextController.text.isNotEmpty) {
      return IconButton(
        icon: const Icon(Icons.close),
        color: Colors.grey,
        onPressed: () {
          setState(() {
            _searchTextController.text = "";
          });
        },
      );
    } else {
      return null;
    }
  }

  // Display the list with header if we are not searching
  // Display the list with only languages if we are searching
  Widget _displayTheRightList() {
    if (_searchTextController.text == "") {
      return _displayListWithHeaders();
    } else {
      return _displaySearchedList();
    }
  }

  // Display the language list filtered
  Widget _displaySearchedList() {
    List<Language> searchedList = _languageList
        .where((e) => e.name
            .toLowerCase()
            .contains(_searchTextController.text.toLowerCase()))
        .toList();

    // Display
    return Expanded(
      child: ListView.builder(
        itemCount: searchedList.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return LanguageListElement(
            language: searchedList[index],
            onSelect: _sendBackLanguage,
          );
        },
      ),
    );
  }

  // Display the list with headers, means we are not searching
  Widget _displayListWithHeaders() {
    List<Language> recentLanguages =
        _languageList.where((e) => e.isRecent).toList();

    // Render
    return Expanded(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverStickyHeader(
            header: Container(
              height: 60.0,
              color: Colors.blue[600],
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Recent Languages',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) => LanguageListElement(
                      language: recentLanguages[i],
                      onSelect: _sendBackLanguage,
                    ),
                childCount: recentLanguages.length,
              ),
            ),
          ),
          SliverStickyHeader(
            header: Container(
              height: 60.0,
              color: Colors.blue[600],
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: const Text(
                'All languages',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) => LanguageListElement(
                      language: _languageList[i],
                      onSelect: _sendBackLanguage,
                    ),
                childCount: _languageList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(
              top: 12.0,
              bottom: 12.0,
              left: 8.0,
              right: 8.0,
            ),
            child: TextField(
              controller: _searchTextController,
              onChanged: (text) {
                setState(() {});
              },
              decoration: InputDecoration(
                hintText: "Search",
                border: InputBorder.none,
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
                prefixIcon: const Icon(
                  Icons.search,
                  size: 24.0,
                  color: Colors.grey,
                ),
                suffixIcon: _displayDeleteTextIcon(),
              ),
            ),
          ),
          _displayTheRightList(),
        ],
      ),
    );
  }
}