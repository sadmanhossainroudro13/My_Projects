//Stock Market Analyzer CLI
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

//logic
//if price is greater than 10 then save it to a file
//otherwise showing it in a graph
void main() async {
  print("📈 Stock Market Analyzer Started...");
  print("Type 'stop' and press Enter to exit.\n");
  Stream<int> random = Stream.periodic(Duration(seconds: 1), (data) {
    return Random().nextInt(16);
  }).take(10);

  File myFile = File('high_price.txt');

  Stream<int> broadcastStream = random.asBroadcastStream();

  // await broadcastStream.listen((data) => print("Stock Market price: $data"));

  StreamSubscription sub1 = broadcastStream.where((data) => data > 10).listen((
    data,
  ) async {
    await myFile.writeAsString(
      "High price alert: $data\n",
      mode: FileMode.append,
    );
    print("Addedd $data to high_price.txt");
  });

  StreamSubscription sub2 = broadcastStream.where((data) => data <= 10).listen((
    data,
  ) {
    String stars = "";
    for (int i = 0; i < data; i++) {
      stars += "*";
    }
    print("📊 $stars ($data)");
  });

  ///Stop Logic
  StreamSubscription inputStream = stdin.transform(Utf8Decoder()).listen((
    input,
  ) {
    if (input.trim().toLowerCase() == "stop") {
      print("\n🛑 User requested to STOP!");

      sub1.cancel();
      sub2.cancel();

      print("Exiting Program");

      exit(0);
    }
  });

  await sub1.asFuture();

  await Future.delayed(Duration(seconds: 1));

  print('\n--- ✅ Stream Finished. Reading File ---');
  if (await myFile.exists()) {
    String content = await myFile.readAsString();
    if (content.isEmpty) {
      print("No high prices greater than 10 exists");
    } else {
      print("File information:\n$content");
    }
  } else {
    print("File not found maybe no higjh prices were generated");
  }

  //Now removing all information from high price
  myFile.delete();
  exit(0);
}
