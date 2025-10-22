import 'dart:math';

void main() {

  int N = 6; 
  double Y = 4.6 * N;
  double Z = 36.6 / N;

  double X_start = 1.23 * N;         
  double X_end = X_start + 10;        
  double deltaX = 1.0;  

  double Function(double x) aFunc(double y, double z) {

    double Function(double x) bFunc = (double x) {
        return pow(cos(atan((pow(x, 2) + Y) / (Z + 1))), 2) + (x / Y) * exp(3 * x + Y);
    };

    double getB(double x) {
        double b = bFunc(x);
        return (1 + sqrt(pow(sin(pow((x + y).abs(), 0.4)), 2))) /
              (2 + pow(b, 2) + pow(sin(pow(y, 3)), 2)) +
              tan(3 * x) / y;
    }
    return getB;
  }
             

  print("Табулювання функції a(x,y,z,b):");
  for (double x = X_start; x <= X_end; x += deltaX) {
    double a = aFunc(Y, Z)(x);
    print('${x.toStringAsFixed(2)}\t\t${a.toStringAsFixed(5)}');
  }
}







 




