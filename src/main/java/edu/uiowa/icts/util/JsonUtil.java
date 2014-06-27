package edu.uiowa.icts.util;

import java.io.IOException;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Iterator;

import org.apache.commons.lang.StringUtils;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.Ostermiller.util.CSVPrinter;

/**
 * @author rrlorent
 */
public class JsonUtil {

	public String jsonToXml( JSONArray array ) throws JSONException {
    	return jsonToXml("object", array);
    }
    
    @SuppressWarnings("rawtypes")
    public static String jsonToCSV( JSONArray array ) throws JSONException, IOException {
    	JSONObject object;
    	Iterator iter;
    	String key;
    	
    	ArrayList<ArrayList<String>> list = new ArrayList<ArrayList<String>>();
    	
    	int length = array.length();
    	ArrayList<String> headers = new ArrayList<String>();
    	if( length > 0 ){
    		object = array.getJSONObject(0);
    		iter = object.keys();
    		while( iter.hasNext() ){
    			String value = (String) iter.next();
    			headers.add(""+value);
    		}
    	}
    	list.add(headers);
    	
    	ArrayList<String> tmp;
    	for( int i=0; i<array.length(); i++ ){
    		object = array.getJSONObject(i);
    		iter = object.keys();
    		tmp = new ArrayList<String>();
    		while( iter.hasNext() ){
    			key = (String) iter.next();
    			Object value = object.get(key); 
    			tmp.add( value.toString() );
    		}
    		list.add(tmp);
    	}

    	String[] tmpArr;
    	String[][] mainArr = new String[ list.size() ][];
    	for( int g=0; g<list.size(); g++ ){
    		tmpArr = list.get(g).toArray(new String[list.get(g).size()]);
    		mainArr[g] = tmpArr;
    	}
    	StringWriter out = new StringWriter();
    	CSVPrinter csvPrinter = new CSVPrinter(out);
    	csvPrinter.writeln( mainArr );
    	out.flush();
    	String csv = out.toString();
    	out.close();
    	
    	return csv;
    }
    
    @SuppressWarnings("rawtypes")
    public static String jsonToXml( String objectName, JSONArray array ) throws JSONException {
    	String xml = "<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>";
    	xml += "<"+objectName+"s>";
    	JSONObject object;
    	Iterator iter;
    	String key;
    	for( int i=0; i<array.length(); i++ ){
    		object = array.getJSONObject(i);
    		iter = object.keys();
    		xml += "<"+objectName+">";
    		while( iter.hasNext() ){
    			key = (String) iter.next();
    			xml += "<"+StringUtils.remove(key, String.valueOf(' '))+">"+object.get(key)+"</"+StringUtils.remove(key, String.valueOf(' '))+">";
    		}
    		xml += "</"+objectName+">";
    	}
    	xml += "</"+objectName+"s>";
    	return xml;
    }
	
}