class DataManager {
  static List<String> allData = [];

  static void generateData() {
    if (allData.isNotEmpty) return;

    allData = [
      "Apple", "Amazon", "Alibaba",
      "Bangladesh", "Barisal", "Bogra",
      "Cricket", "Chatgpt", "Chittagong",
      "Dart", "Dhaka", "Docker",
      "Facebook", "Flutter", "Firebase",
      "Google", "Gmail", "Github",
      "Roogle", "Rahim", "Karim", "Youtube", "Yahoo"
    ];

    for (int i = 0; i < 500000; i++) {
      allData.add("User Result $i");
    }
  }
}