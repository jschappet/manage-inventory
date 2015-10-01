package edu.uiowa.icts.util;

import java.util.HashMap;

public class CaseInsensitiveHashMap extends HashMap<String, String> {

	private static final long serialVersionUID = -5489310896806161077L;

	@Override
    public String put(String key, String value) {
       return super.put(key.toLowerCase(), value);
    }

    // not @Override because that would require the key parameter to be of type Object
    public String get(String key) {
       return super.get(key.toLowerCase());
    }
}