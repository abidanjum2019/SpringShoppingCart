package com.abid.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.abid.dao.QueriesDao;
import com.abid.model.Queries;

@Service
public class QueriesServiceImpl implements QueriesService {

	@Autowired
	private QueriesDao queryDao;

	public void addQuery(Queries queries) {

		queryDao.addQuery(queries);
	}

}
