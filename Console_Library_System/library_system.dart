class Book {
  String title;
  String author;
  String isbn;
  bool isAvailable;

  Book({
    required this.title,
    required this.author,
    required this.isbn,
    required this.isAvailable,
  });

  @override
  String toString() {
    return '{Title: $title, Author: $author}';
  }
}

class Library {
  List<Book> _books;

  Library(this._books);

  void showBook() {
    print("Book number is: ${_books.length}");
  }

  Future<String> searchBook(String query) async {
    print("Wait a little......");
    await Future.delayed(Duration(seconds: 2));
    var searchBook = _books.where(
      (b) => b.title == query || b.author == query || b.isbn == query,
    );
    if (searchBook.isEmpty) {
      return "Book not found";
    } else {
      return searchBook.toString();
    }
  }

  Future<String> borrowBook(String book) async {
    print("Wait  a little.....");
    await Future.delayed(Duration(seconds: 3));
    for (var item in _books) {
      if (item.title == book) {
        if (item.isAvailable == true) {
          item.isAvailable = false;
          return "You borrowed the book : $book";
        } else {
          return "Sorry! The book is already borrowed";
        }
      }
    }
    return "The book is not Found";
  }
}

void main() async {
  Book b1 = Book(
    title: "Flutter Book",
    author: "Demo Author",
    isbn: "1234",
    isAvailable: true,
  );

  Book b2 = Book(
    title: "dart book",
    author: "Demo Author for Dart",
    isbn: "5678",
    isAvailable: true,
  );

  var lib = Library([b1, b2]);

  lib.showBook();

  var found = await lib.searchBook("dart book");
  print(found);

  var borrowBook = await lib.borrowBook("dart book");
  print(borrowBook);

  var borrowBook1 = await lib.borrowBook("dart book");
  print(borrowBook1);
}
