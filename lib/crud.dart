import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stc_portal/student.dart';
//import 'package:stc_portal/student.dart';

//inserting doesnt need await hence no future return

class crud {
  static var x;
  Future<Map<String, dynamic>> readMarks(String id) async {
    var m;
    print(id);
    var db = FirebaseFirestore.instance;
    await db.collection('student').doc(id).get().then((value) {
      //data = value.data() as Map<String, dynamic>;
      m = value.get('marks');
    });
    // student s = student(
    //     name: data['name'],
    //     email: data['email'],
    //     marks: m,
    //     id: data['id'],
    //     sem: data['sem'],
    //     dept: data['dept'],
    //     rollno: data['rollno']);
    return m;
  }

  Future<student> readStudent(String id) async {
    var data, m;
    // print(id);
    var db = FirebaseFirestore.instance;
    await db.collection('student').doc(id).get().then((value) {
      data = value.data() as Map<String, dynamic>;
      m = value.get('marks');
    });
    student s = student(
        name: data['name'],
        email: data['email'],
        marks: m,
        id: data['id'],
        sem: data['sem'],
        dept: data['dept'],
        rollno: data['rollno']);
    return s;
  }

  void insertStudent(student s)  {
    print(s.getId());
    Map<String, dynamic> mp={
      'name':s.getName(),
      'email': s.getEmail(),
      'marks':s.getMarks(),
      'id': s.getId(),
      'sem':s.getSem(),
      'dept':s.getDept(),
      'rollno':s.getRollno()
    };
    print(2);
    // mp!['name'] = s.getName();
    // mp['email'] = s.getEmail();
    // mp['marks'] = s.getMarks();
    // mp['id'] = s.getId();
    // mp['sem'] = s.getSem();
    // mp['dept'] = s.getDept();
    // mp['rollno'] = s.getRollno();
    print(mp);
    var db = FirebaseFirestore.instance;
     db.collection('student').doc(s.getId()).set(mp, SetOptions(merge: true)).onError((error, stackTrace) => print(error));
    print(3);
  }
}
