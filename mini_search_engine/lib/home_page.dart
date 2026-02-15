import 'package:flutter/material.dart';
import 'package:mini_search_engine/dataManager.dart';
import 'package:mini_search_engine/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> suggestions = [];
  bool isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    DataManager.generateData();
  }

  void goToSearchPage(String keyword) {
    if (keyword.trim().isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchPage(searchKeyword: keyword),
        ),
      );
    }
  }

  void runFilter(String query) {
    if (query.isEmpty) {
      setState(() {
        isSearching = false;
        suggestions = [];
      });
    } else {
      String searchKey = query.toLowerCase();

      List<String> startsWith = DataManager.allData
          .where((item) => item.toLowerCase().startsWith(searchKey))
          .toList();

      List<String> contains = DataManager.allData
          .where((item) =>
      item.toLowerCase().contains(searchKey) &&
          !item.toLowerCase().startsWith(searchKey))
          .toList();

      setState(() {
        isSearching = true;
        suggestions = (startsWith + contains).take(10).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(color: Colors.black.withOpacity(0.6)),

          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/Roogle.png",
                      height: 100,
                    ),
                    const SizedBox(height: 5),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              spreadRadius: 1)
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
                        child: TextField(
                          controller: _searchController,
                          onChanged: runFilter,
                          // কীবোর্ডের Enter চাপলে কাজ করার জন্য
                          onSubmitted: (value) => goToSearchPage(value),
                          decoration: InputDecoration(
                            hintText: "Search Roogle",
                            border: InputBorder.none,
                            icon: const Icon(Icons.search, color: Colors.grey),

                            // আইকন ক্লিকেবল করার জন্য IconButton ব্যবহার করতে হবে
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.download_done_outlined, color: Colors.blue),
                              onPressed: () {
                                goToSearchPage(_searchController.text);
                              },
                            ),
                          ),
                        )
                      ),
                    ),
                    if (isSearching && suggestions.isNotEmpty)
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        constraints: const BoxConstraints(maxHeight: 250),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: suggestions.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: const Icon(Icons.history, size: 20),
                              title: Text(suggestions[index]),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SearchPage(
                                            searchKeyword: suggestions[index])));
                              },
                            );
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}