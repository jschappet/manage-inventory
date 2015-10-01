package edu.uiowa.icts.util;

import java.util.Comparator;

public class DoubleComparator implements Comparator<Object> {
	@SuppressWarnings( "rawtypes" )
	public int compare( Object one, Object two ) {
		Pair first = (Pair) one;
		Pair second = (Pair) two;
		double x = (Double) first.getLeft();
		double y = (Double) second.getLeft();
		if ( x > y )
			return 1;
		else if ( x < y )
			return -1;
		else
			return 0;
	}
}