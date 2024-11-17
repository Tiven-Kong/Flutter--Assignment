import 'dart:async';

enum Skill { FLUTTER, DART, OTHER }

String skillDisplay(Skill skill) {
  switch (skill) {
    case Skill.FLUTTER:
      return "Flutter";
    case Skill.DART:
      return "Dart";
    case Skill.OTHER:
      return "OTHER";
  }
}

class Employee {

  String _name;
  double _baseSalary;
  List<Skill> _listOfSkill;
  Address _address ;
  int _yearsOfExperience;

  Employee(this._name, this._baseSalary, this._listOfSkill, this._yearsOfExperience , this._address);

  Employee.mobileDevelop(String name, double baseSalary, int yearsOfExperience , Address address)
      : _name = name,
        _baseSalary = baseSalary,
        _yearsOfExperience = yearsOfExperience,
        _address=address ,
        _listOfSkill = [Skill.FLUTTER, Skill.DART];

  Employee.other(String name, double baseSalary, int yearsOfExperience , Address address)
      : _name = name,
        _baseSalary = baseSalary,
        _yearsOfExperience = yearsOfExperience,
        _listOfSkill = [Skill.OTHER],
        _address=address ;

  //getter to access the private ;
   get name =>_name ;
   get baseSalary=>_baseSalary ;
   get listOfSkill=>_listOfSkill ;
   get yearsOfExperience =>_yearsOfExperience ;
   get address=>_address ;

     double computesalary(){

double salarySpecifice = _baseSalary+(_yearsOfExperience*2000) ;
  for (var  Skillsalary in _listOfSkill){
switch(Skillsalary){
  case Skill.FLUTTER:
   salarySpecifice+=2000;
  case Skill.DART:
   salarySpecifice+=1000 ;
  case Skill.OTHER:
   salarySpecifice+=500 ;
  default:
   salarySpecifice+=500 ;

}

  }
  return salarySpecifice ;
 }

}

class Address {

  String _street;
  String _city;
  String _zipcode;

  Address(this._street, this._city, this._zipcode);

}

void main() {
  // Create a mobile developer
var em1 = Employee("ven", 4000, [Skill.OTHER], 3, Address("204", "PP",  "345500"));

  print(em1.computesalary()) ;
}
