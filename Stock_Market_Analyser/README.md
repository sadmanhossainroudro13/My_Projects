# 📈 Stock Market Analyzer CLI

A command-line interface (CLI) tool built with **Dart** that simulates real-time stock price updates using **Streams**. It analyzes incoming price data asynchronously, visualizes trends using ASCII graphs, and logs high-value alerts to a file.

> **Part of Dart Learning Journey: Week 3 Grand Project** 🚀

## ✨ Features

- **Real-time Simulation:** Generates random stock prices every second using `Stream.periodic`.
- **Broadcast Streaming:** Handles multiple subscribers simultaneously using `asBroadcastStream`.
- **Data Visualization:** Displays a dynamic ASCII bar chart (e.g., `*****`) for prices ≤ 10.
- **File Logging:** Automatically saves high price alerts (> 10) to a local file (`high_price.txt`).
- **User Control:** Allows the user to stop the stream instantly by typing `stop`.
- **Asynchronous Handling:** Uses `async/await` for non-blocking I/O operations.

## 🛠️ Tech Stack & Concepts

- **Language:** Dart
- **Core Concepts:**
  - `Stream` & `StreamSubscription`
  - `BroadcastStream` (Multi-listening)
  - `File I/O` (Read/Write/Append)
  - `stdin` (User Input Handling)
  - `async`, `await`, `Future`

## 🚀 How to Run

1. **Clone the repository:**
   ```bash
   git clone <your-repo-link>
   cd <your-project-folder>