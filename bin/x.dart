void main(){
  int even;
  int ood;
  int first=4;
  int last=10;
  int total;
  int n=20;
  total=last-first+1;
  if(n%2==0){
   print( even=total~/2);
    ood=total~/2;
  }
  else{
  if(first%2==0){
   print( even=total~/2+1);
   print( ood=total~/2);
  }
  else{
   print( ood=total~/2+1);
   print( even=total~/2);
  }
}
}