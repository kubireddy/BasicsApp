package com.klr.repositoryAndService;

import java.util.Map;

public interface RepositoryService {
	public void save(Map<String, ? extends Object> input);
	public String checkUserExistance(Map<String, ? extends Object> input);
	public void replaceToken(Map<String, ? extends Object> input);
}
