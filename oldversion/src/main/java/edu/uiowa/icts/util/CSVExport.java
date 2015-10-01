package edu.uiowa.icts.util;

import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Arrays;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.Ostermiller.util.ExcelCSVPrinter;

public class CSVExport{

	public CSVExport(){}
	
	private static final Log log = LogFactory.getLog(CSVExport.class);
	
	public ByteArrayOutputStream generateCSV(ArrayList<ArrayList<String>> args){
		ByteArrayOutputStream csv = new ByteArrayOutputStream();
		Object[] x;
		String[] y;
		try{
			BufferedOutputStream out = new BufferedOutputStream(csv);
			ExcelCSVPrinter ex = new ExcelCSVPrinter(out);
			for (ArrayList<String> s : args) {
				x = s.toArray();
				y = Arrays.asList(x).toArray(new String[x.length]);
				ex.writeln(y);
			}
		}catch (Exception e){
			log.error("error creating csv",e);
		}
		return csv;
	}
	
	public String generateCSV(ArrayList<ArrayList<String>> args, boolean quote){
		StringWriter stringWriter = new StringWriter();
		Object[] x;
		String[] y;
		try{
			ExcelCSVPrinter ex = new ExcelCSVPrinter(stringWriter, true, true);
			for (ArrayList<String> s : args) {
				x = s.toArray();
				y = Arrays.asList(x).toArray(new String[x.length]);
				ex.writeln(y);
			}
		}catch (Exception e){
			log.error("error creating csv",e);
		}
		return stringWriter.toString();
	}
}