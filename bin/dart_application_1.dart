

 class Person{
 late String name;
  late String age;


  Person(this.name,this.age);

  void displayinfo(){
   print('Name:$name');
   print('Age:$age');
 }


 
   }
    class Student extends Person{
       late String university;
      Student(super.name,super.age,{required this.university});

        @override
       void displayinfo(){
        super.displayinfo();
        print('University:$university');
      }
  
  }
    class Employee extends Person{
      late double salary;
      Employee(super.name,super.age,{required this.salary});

       @override
      void displayinfo(){
        super.displayinfo();
        print('Salary:$salary');


    }}
    class Manager extends Employee{
      late String department;
      Manager(super.name,super.age,{ required super.salary, required this.department});
       @override
      void displayinfo(){
        super.displayinfo();
        print('Department:$department');


      }}
      class Teacher extends Employee{
        late String subject;
        Teacher(super.name,super.age,{required super.salary,required this.subject});

         @override
      void displayinfo(){
        super.displayinfo();
        print('Subgect:$subject');

      }
      }
      void main(){
        Person p1= Person("Mariam", "20");
        Student s1=Student("Mariam", "20", university: "HTI");
        Employee e1=Employee("Mariam", "20", salary: 3000);
        Manager m1=Manager("Mariam", "20", salary: 3000, department: "HR");
        Teacher t1=Teacher("Mariam", "20", salary: 3000, subject: "OOP");


        display(p1);
        display(s1);
        display(e1);
        display(m1);
        display(t1);
      }
      void display(Person person){
        person.displayinfo();

      }
  abstract class Shape{
    double height;
    double width;

    Shape(this.height,this.width);

    void displayinfo(){
      print('Height:$height');
      print('Width:$width');
    }
   double calculateArea();

   
  }
  class Rectangle extends Shape{
        Rectangle(super.height,super.width);

        @override
  double calculateArea() {
   return height* width;
  }
  }
  class Circle extends Shape{
    Circle(super.height,super.width);
   @override
  double calculateArea() {
   return 3.14* height* width;

  }}
  class Squre extends Shape{
    Squre(super.height,super.width);
    @override
  double calculateArea() {
   return height*height;

  }}
 
    
 
  // void main(){
  //   List<int>l=[-1,-2,-3,0,1,2,3,4];
  //   l.add(7);
  //   l.addAll([8,9]);
  //   l.removeWhere((int y) => y<0,);
  //    print(l);
  //   l= l.map(
  //     (int x)=>x*4
  //    ).toList();
  //    print(l);
  //   print (l.firstWhere((element) => element>1,));}
    

 