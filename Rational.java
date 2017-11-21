/* Danial Memon
 * Rational.java 
 * Units are: 
 * Distance: Meters
 * Time: Seconds
 * Mass: Grams
 * 
 */

import java.util.Arrays;

public class Rational implements Comparable<Rational>{
	private int num;
	private int den;
	private int[] dim;
	
	public Rational(int numerator, int denominator, int[] dimmension){
		if(denominator == 0){
			throw new IllegalArgumentException("Denominator argument is 0");
		}
		int GreatestCommonDivisor = gcd(numerator, denominator);
		num = numerator/GreatestCommonDivisor;
		den = denominator/GreatestCommonDivisor;
		//position 0 is distance, position 1 is time, position 2 is mass 
		dim = dimmension;
	}
	
	public Rational add(Rational b){
		//first check if dimmensions are the same
		if(Arrays.equals(this.dim,b.dim)){
			//now add the Rationals together
			int newNum, newDen;
			int [] newDim;
			newNum = ((this.num * b.den) + (this.den * b.num));
			newDen = this.den * b.den;
			Rational result = new Rational(newNum, newDen, this.dim);
			result.simplify();
			return result;
		}
		else{
			//throw an exception
			throw new IllegalArgumentException("Dimmensions of the arguments were not equal");
		}
	}	
		
	public Rational subtract(Rational b){
		//first check if dimmensions are the same
		if(Arrays.equals(this.dim,b.dim)){
			//now add the Rationals together
			int newNum, newDen;
			int [] newDim;
			newNum = ((this.num * b.den) - (this.den * b.num));
			newDen = this.den * b.den;
			Rational result = new Rational(newNum, newDen, this.dim);
			result.simplify();
			return result;
		}
		else{
			//throw an exception
			throw new IllegalArgumentException("Dimmensions of the arguments were not equal");
		}
	}			
		
	public Rational multiply(Rational b){
		int newNum, newDen;
		newNum = this.num * b.num;
		newDen = this.den * b.den;
		int [] newDim = new int[3];
		newDim[0] = (this.dim[0] + b.dim[0]);
		newDim[1] = (this.dim[1] + b.dim[1]);
		newDim[2] = (this.dim[2] + b.dim[2]);
		
		Rational result = new Rational(newNum,newDen, newDim);
		result.simplify();
		return result;
	}
		
	//need to fix units	
	public Rational divide(Rational b){
		int recipNum = b.den, recipDen = b.num;
		b.num = recipNum;
		b.den = recipDen;
		
		int newNum, newDen;
		newNum = this.num * b.num;
		newDen = this.den * b.den;
		int [] newDim = new int[3];
		newDim[0] = (this.dim[0] - b.dim[0]);
		newDim[1] = (this.dim[1] - b.dim[1]);
		newDim[2] = (this.dim[2] - b.dim[2]);
		
		Rational result = new Rational(newNum,newDen, newDim);
		result.simplify();
		return result;
	}
			
	@Override public int compareTo(Rational b) {
		final int LESS = -1;
		final int EQUAL = 0;
		final int GREATER = 1;	
		
		if((Arrays.equals(this.dim,b.dim))){
			if(((float)this.num/(float)this.den) > ((float)b.num/(float)b.den)){
				return GREATER;
			}
			else if(((float)this.num/(float)this.den) < ((float)b.num/(float)b.den)){
				return LESS; 
			}
			else{
				return EQUAL;
			}
		}
		else{
			//throw an exception
			throw new IllegalArgumentException("Given arguments can not be compared");	
		}		
	
	}
	
	public void simplify (){
		int g = gcd(this.num, this.den);
		this.num = this.num/g;
		this.den = this.den/g;
		
	}	
	
	public int gcd(int a, int b){
		if(a == 0){
			return b;
		}
		else if(b == 0){
			return a;
		}
		int r = a % b;
		return gcd(b,r);		
	}
	
	public void printRational(){
		String unit = "";
		
		if(this.dim[0] == 1){
			unit = unit + " meters";
		}
		else if(this.dim[0] != 0){
			unit = unit + "^" + this.dim[0];
		}
		
		if(this.dim[1] == 1){
			unit = unit + " meters";
		}
		else if(this.dim[1] != 0){
			unit = unit + "^" + this.dim[1];
		}		
		if(this.dim[2] == 1){
			unit = unit + " meters";
		}
		else if(this.dim[2] != 0){
			unit = unit + "^" + this.dim[2];
		}		
		
		
		int numSign = 0, denSign = 0;
		String sign = "";
		
		if(this.num > 0){
			numSign += 1;
		} 
		if(this.num < 0){
			numSign -= 1;
		}
		
		if(this.den > 0){
			denSign += 1;
		} 
		if(this.den < 0){
			denSign -= 1;
		}
		if(numSign/denSign < 0){	
			sign = "-";
		}		
		
		String toPrint = sign + "" + Math.abs(this.num);
		if(this.den != 1){
			toPrint = toPrint + "/" + Math.abs(this.den) + unit;
		}
		System.out.println(toPrint);
		
	}
	
	public static void main(String [] args){
		int[] test = new int[3];
		int[] best = new int[3];
		int[] hest = new int[3];

		test[0] = 1;
		//test[1] = 1;
		best[1] = 1;
		hest[0] = 1;
		Rational z = new Rational(1,3, hest);
		Rational y = new Rational(3,9, hest);
		
		
		Rational a = new Rational(1,5, test);
		Rational b = new Rational(1,2, test);
		System.out.println(a.compareTo(b));

		a.printRational();
		b.printRational();
//		Rational c = a.add(b);
//		Rational d = a.subtract(b);
//		Rational e = b.subtract(a);
//		c.printRational();
//		d.printRational();
//		e.printRational();
		
		
		Rational f = a.multiply(b);
		Rational g = b.divide(a);
		f.printRational();
		g.printRational();
		
		
	}
}		
		
	
