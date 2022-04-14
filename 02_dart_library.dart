//数字  
void digits()
{
  print('*' * 40);
  print('数字');
  print('*' * 40);

  print(int.parse('42'));
  assert(int.parse('42') == 42);
  assert(int.parse('0x42') == 66);
  assert(double.parse('0.50') == 0.5);
}

void main(List<String> args){
  digits();
}