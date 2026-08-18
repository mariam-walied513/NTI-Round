import 'dart:io';

void main() {
  int p = 0;
  int n = 0;
  int z = 0;

  for (int i = 1; i <= 8; i++) {
    stdout.write('enter number $i: ');
    int num = int.parse(stdin.readLineSync() ?? '0');

    if (num > 0) {
      p++;
    } else if (num < 0) {
      n++;
    } else {
      z++;
    }
  }

  print('positive=$p');
  print('negative=$n');
  print('Zero=$z');
}