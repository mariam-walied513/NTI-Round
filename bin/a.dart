

int add(int x1,int x2,String x3){
   if(x3 == '+'){
      return x1 + x2;
   }
   // default/fallback value when operator is not recognized
   return 0;
}

void main(){
   int result = add(5,6,'+');
   print(result);
}