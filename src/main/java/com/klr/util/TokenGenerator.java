package com.klr.util;

import java.util.UUID;

public class TokenGenerator {
	
	//returns the random token with 8 digit alphabet.
	public static String getToken() {
		return UUID.randomUUID().toString().substring(0, 8);
	}
}
