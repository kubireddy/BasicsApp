package com.klr.repositoryAndService;

import java.util.Map;

public interface RepositoryService {
	public Map<String, ? extends Object>  saveOrUpdateOrInsert(Map<String, ? extends Object> input);
}
