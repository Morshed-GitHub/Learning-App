// ignore_for_file: public_member_api_docs, sort_constructors_first
class Class {
  String image;
  String duration;
  String faculty;
  String subject;

  Class({
    required this.image,
    required this.duration,
    required this.faculty,
    required this.subject,
  });
}

class ClassModel {
  static final List<Class> _list = [
    Class(
        image: "arts.png",
        duration: "2h 25min",
        faculty: "Arts & Humanities",
        subject: "Draw & Paint Arts"),
    Class(
        image: "programmer.jpeg",
        duration: "7h 2min",
        faculty: "Computer Science & Engineering",
        subject: "Advanced Programming"),
    Class(
        image: "digital marketing.jpg",
        duration: "2h 25min",
        faculty: "Digital Marketing & Analytics",
        subject: "Digital Marketing"),
    Class(
        image: "scientific.jpg",
        duration: "18h 55min",
        faculty: "Scientific Research & Analysis",
        subject: "Neural Science"),
    Class(
        image: "social influencer.jpg",
        duration: "12h 25min",
        faculty: "Social Media Influencer Marketing",
        subject: "Social Media Influencer"),
    Class(
        image: "statistics.jpg",
        duration: "14h 25min",
        faculty: "Statistics & Data Analysis",
        subject: "Statistics"),
    Class(
        image: "social science.jpg",
        duration: "9h 15min",
        faculty: "Social Science & Policy",
        subject: "Social Science"),
    Class(
        image: "graphic designer.jpg",
        duration: "16h 45min",
        faculty: "Arts & Humanities",
        subject: "Graphics Design"),
  ];

  Class searchClassBySubject(String subject) {
    return _list.firstWhere((element) => element.subject == subject);
  }

  // Getter Method
  List<Class> get list => _list;
}
