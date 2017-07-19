package com.klr.repository;

import java.util.Map;

public interface RepositoryService {
	public Map<String, ? extends Object>  save(Map<String, ? extends Object> input);
}
