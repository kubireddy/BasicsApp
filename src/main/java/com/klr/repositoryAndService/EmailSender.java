package com.klr.repositoryAndService;

import java.util.Map;

public interface EmailSender {
	public void sendMail(Map<String, ? extends Object> input);
}
