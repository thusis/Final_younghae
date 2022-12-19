package com.kh.young.supplement.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.young.model.vo.PageInfo;
import com.kh.young.model.vo.ProCategory;

@Repository("pcDAO")
public class ProCategoryDAO {

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("supplementMapper.getListCount");
	}

	public ArrayList<ProCategory> allCategory(SqlSessionTemplate sqlSession, PageInfo pi) {
		//로우 바운드 사용 ( 오프셋, 보드리밋 )
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("supplementMapper.allCategory", 0, rowBounds);
	}

	public ProCategory selectCategory(SqlSessionTemplate sqlSession, int cateNum) {
		return sqlSession.selectOne("supplementMapper.selectCategory", cateNum);
	}
	
}
