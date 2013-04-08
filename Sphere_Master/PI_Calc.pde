// Calculate PI with arbitrary precision
// ( source: http://java.sun.com/docs/books/tutorial/rmi/client.html )

// Machins Formula :  pi/4 = 4*arctan(1/5) - arctan(1/239)
//import java.math.BigDecimal;
/*

public int[] PI(int n) 
{
  println("PI Executed");
  BigDecimal FOUR = BigDecimal.valueOf(4);
  int s = n + 5;
  BigDecimal atan239 = atan(239, s);
  BigDecimal atan5 = atan(5, s);

  BigDecimal pi = atan5.multiply(FOUR).subtract(atan239).multiply(FOUR);
  BigDecimal digits = pi.setScale(n, BigDecimal.ROUND_HALF_UP);
  
  String raw = digits.toString(); 
  int[] num = new int[raw.length()];

   for (int i = 0; i < raw.length(); i++) //cycle through and assign digits to Int array
   {
        num[i] = raw.charAt(i) - '0'; // Find Ascii character and minus '0'
        print(raw.length());
   }  
   
   return num; // Return the Int array
}
 
// Power Series expansion : atan(x) = x - (x^3)/3 + (x^5)/5 - (x^7)/7 +  (x^9)/9 ...
/*
BigDecimal atan(int invx, int s) {
  int round = BigDecimal.ROUND_HALF_EVEN;
  BigDecimal r, n, t, invx2 = BigDecimal.valueOf(invx * invx);
  r = n = BigDecimal.ONE.divide(BigDecimal.valueOf(invx) , s, round);
  int i = 1;
  do {
    n = n.divide(invx2, s, round);
    t = n.divide(BigDecimal.valueOf(2*i+1), s, round);
    r = (i%2 == 0) ? r.add(t) : r.subtract(t);
    i++;
  } while (t.compareTo(BigDecimal.ZERO) != 0);
  
  return r;
}
*/
