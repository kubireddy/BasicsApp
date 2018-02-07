package com.klr.repositoryAndService;

import java.util.Map;

public interface RepositoryService {
	public void save(Map<String, ? extends Object> input);
	public String checkUserExistance(Map<String, ? extends Object> input);
	public void replaceToken(Map<String, ? extends Object> input);
	public String verify(Map<String, ? extends Object> input);
	public String checkEmployerId(Map<String, ? extends Object> input);
	public String verifyToken(Map<String, ? extends Object> input);
	public void updateEnableFlag(Map<String, ? extends Object> input);
}
