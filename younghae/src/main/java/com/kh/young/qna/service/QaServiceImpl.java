package com.kh.young.qna.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.young.qna.dao.QaDao;

@Service("QaService")
public class QaServiceImpl implements QaService {

	@Autowired
	private SqlSessionTemplate sqlSsession;
	
	@Autowired
	private QaDao qdao;
	
}
