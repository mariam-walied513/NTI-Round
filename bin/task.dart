// void main(){
//  int sum=0;
//  int n=5;
// for(int i=1;i<n;i++){
//   sum+=i;
// }
// print("sum = $sum");
// }

// to deal with input and output we have to import dart:io library;
// to make the user input his details;
import 'dart:io';
void main(){
List<List<String>> Seats=[];

  for(int i=0;i<5;i++){
    Seats.add(['E','E','E','E','E']);
  }
  Map<String,String> booking={};
  print("Welcome to our theatre");
  while(true){
    print("press 1 to book a seat");
    print("press 2 to view the seats");
    print("press 3 to view user details");
    print("press 4 to exit");
    // taking input from user
    String? choice=stdin.readLineSync();
    if(choice=='1'){
      print("Enter your name");
      String? name=stdin.readLineSync();
      print("Enter your phone number");
      String? phone=stdin.readLineSync();
      print("Enter the row number");
      // typecasting string to int
      int? row=int.parse(stdin.readLineSync()!);
      print("Enter the column number");
      // typecasting 
      int? col=int.parse(stdin.readLineSync()!);
      // checking if the seat is empty or booked
      if(Seats[row-1][col-1]=='E'){
        Seats[row-1][col-1]='B';
        booking[name!]= "$row,$col";
        print("Seat booked successfully");
      }
      else{
        print("Seat is already booked");
      }
    }
    else if(choice=='2'){
      // for rows;
      for(int i=0;i<5;i++){
        // for columns;
        for(int j=0;j<5;j++){
          // stdout instead of print to print in the same line;
          stdout.write("${Seats[i][j]} ");
        }
        print("");
      }
    }
    else if(choice=='3'){
      print("User Details:");
      // printing the user details using forEach loop
     booking.forEach((key, value) {
        print("Name: $key, Seat: $value");
      });
    }
    else if(choice=='4'){
      print("see you Back");
      break;
    }

  }

}