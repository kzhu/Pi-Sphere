// atan function
/*
public BigDecimal atan(int invx, int s) 
{
  int round = BigDecimal.ROUND_HALF_EVEN;
  BigDecimal r, n, t, invx2 = BigDecimal.valueOf(invx * invx);
  r = n = BigDecimal.ONE.divide(BigDecimal.valueOf(invx) , s, round);
  int i = 1;
 
  do {
    n = n.divide(invx2, s, round);
    t = n.divide(BigDecimal.valueOf(2*i+1), s, round);
    r = (i%2 == 0) ? r.add(t) : r.subtract(t);
   // println("atan loop/ " + i);
    i++;
  } while (t.compareTo(BigDecimal.ZERO) != 0);
  
  return r;
}
*/
