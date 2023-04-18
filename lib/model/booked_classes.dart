// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:learning_app/model/classes.dart';

class BookedClasses {
  String image;
  int progressRate;
  String faculty;
  String subject;

  BookedClasses({
    required this.image,
    required this.progressRate,
    required this.faculty,
    required this.subject,
  });
}

class BookedClassesModel {
  static final List<BookedClasses> _list = [
    BookedClasses(
        image: "arts.png",
        progressRate: 16,
        faculty: "Arts & Humanities",
        subject: "Draw & Paint Arts"),
    BookedClasses(
        image: "scientific.jpg",
        progressRate: 9,
        faculty: "Scientific Research & Analysis",
        subject: "Neural Science"),
  ];

  static void addClass(BookedClasses newClass) {
    _list.add(newClass);
  }

  // Getter Method
  List<BookedClasses> get list => _list;
}
