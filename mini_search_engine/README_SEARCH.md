# 🔎 Mini Search Engine (Roogle)

A high-performance Flutter application that simulates a search engine experience. This project demonstrates efficient state management and data handling capable of searching through **500,000+ records** instantly without UI lag.

## 🚀 Features

* **Real-time Search:** Instant suggestions as you type in the home page.
* **Smart Filtering:** Prioritizes results starting with the keyword, followed by partial matches.
* **Performance Optimized:** Uses a central `DataManager` class to manage memory efficiently, avoiding data duplication between screens.
* **Large Dataset Handling:** Smooth scrolling and searching through 500,000 dummy records.
* **Clean UI:** Features transparent app bars, background images, and glassmorphism effects for a modern look.

## 🛠️ Tech Stack

* **Framework:** Flutter
* **Language:** Dart
* **Architecture:** MVC-inspired structure.

## 📂 Project Structure

* `lib/dataManager.dart`: The central data source (Single Source of Truth) that generates and holds the dataset.
* `lib/home_page.dart`: The main landing page with the search bar and auto-complete suggestions.
* `lib/search_page.dart`: The results page that displays filtered data efficiently.

## ⚡ How to Run

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/sadmanhossainroudro13/my_projects.git](https://github.com/sadmanhossainroudro13/my_projects.git)
    ```

2.  **Navigate to the project directory:**
    ```bash
    cd mini_search_engine
    ```

3.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

4.  **Run the app:**
    ```bash
    flutter run
    ```

## 👨‍💻 Author

**Sadman Hossain Roudro**
* [GitHub Profile](https://github.com/sadmanhossainroudro13)

---
*Built with using Flutter*
