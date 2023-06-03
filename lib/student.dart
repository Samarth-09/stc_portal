// ignore_for_file: public_member_api_docs, sort_constructors_first
class student {
  String name;
  String email;
  Map<String, dynamic> marks;
  String id;
  String dept ;
  String sem ;
  String rollno;
  student({
    required this.name,
    required this.email,
    required this.marks,
    required this.id,
    required this.dept,
    required this.sem,
    required this.rollno,
  });

  Map<String, dynamic> getMarks()
  {
    //print(marks);
    return marks;
  }
  void setMarks(String name, dynamic marks)
  {
    
  }
  String getEmail() {
    return email;
  }

  void setEmail(String email) {
    this.email = email;
  }

  String getName() {
    return name;
  }

  void setName(String name) {
    this.name = name;
  }

  String getId() {
    return id;
  }

  void setId(String id) {
    this.id = id;
  }

  String getDept() {
    return dept;
  }

  void setDept(String dept) {
    this.dept = dept;
  }

  String getSem() {
    return sem;
  }

  void setSem(String sem) {
    this.sem = sem;
  }

  String getRollno() {
    return rollno;
  }

  void setRollno(String rollno) {
    this.rollno = rollno;
  }
}
