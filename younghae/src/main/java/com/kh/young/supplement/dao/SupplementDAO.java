package com.kh.young.supplement.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.young.model.vo.Attachment;
import com.kh.young.model.vo.Member;
import com.kh.young.model.vo.PageInfo;
import com.kh.young.model.vo.ProCategory;
import com.kh.young.model.vo.Review;
import com.kh.young.model.vo.ReviewAjax;
import com.kh.young.model.vo.Supplement;

@Repository("pcDAO")
public class SupplementDAO {

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
	
	public ArrayList<Supplement> selectCateProduct(SqlSessionTemplate sqlSession, int cateNum) {
		return (ArrayList)sqlSession.selectList("supplementMapper.selectCateProduct", cateNum);
	}

	public Supplement selectPro(SqlSessionTemplate sqlSession, int proNum) {
		return sqlSession.selectOne("supplementMapper.selectPro", proNum);
	}

	public int insertReview(SqlSessionTemplate sqlSession, Review r) {
		return sqlSession.insert("supplementMapper.insertReview", r);
	}

	public int insertReviewAttm(SqlSessionTemplate sqlSession, Attachment attm) {
		return sqlSession.insert("supplementMapper.insertReviewAttm", attm);
	}

	public Member selectMember(SqlSessionTemplate sqlSession, int i) {
		return sqlSession.selectOne("supplementMapper.selemetMember", i);
	}

	public Review checkReview(SqlSessionTemplate sqlSession, Review r) {
		return sqlSession.selectOne("supplementMapper.checkReview", r);
	}

	public ArrayList<Review> reviewList(SqlSessionTemplate sqlSession, int proNum) {
		return (ArrayList)sqlSession.selectList("supplementMapper.reviewList", proNum);
	}

	public Attachment imageSelect(SqlSessionTemplate sqlSession, int rvNum) {
		return sqlSession.selectOne("supplementMapper.imageSelect", rvNum);
	}

	public int rateUpdate(SqlSessionTemplate sqlSession, Supplement product) {
		return sqlSession.update("supplementMapper.rateUpdate", product);
	}

	public ArrayList<Review> selectReview(SqlSessionTemplate sqlSession, int cateNum, PageInfo pi) {
		//로우 바운드 사용 ( 오프셋, 보드리밋 )
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("supplementMapper.selectReviewList", cateNum ,rowBounds);
	}

	public int getReviewListCount(SqlSessionTemplate sqlSession,  int cateNum) {
		return sqlSession.selectOne("supplementMapper.getReviewListCount", cateNum);
	}

	public ArrayList<ProCategory> searchList(SqlSessionTemplate sqlSession, String search) {
		return (ArrayList)sqlSession.selectList("supplementMapper.searchList", search);
	}

	public int insertReco(SqlSessionTemplate sqlSession, Review r) {
		return sqlSession.insert("supplementMapper.insertReco", r);
	}

	public int deleteReco(SqlSessionTemplate sqlSession, Review r) {
		return sqlSession.delete("supplementMapper.deleteReco", r);
	}

	public ArrayList<Review> adminReviewListN(SqlSessionTemplate sqlSession, PageInfo pi, int i) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("supplementMapper.adminReviewListN", i, rowBounds);
	}

	public ArrayList<Review> adminReviewListNa(SqlSessionTemplate sqlSession, PageInfo pi, int i) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("supplementMapper.adminReviewListNa", i, rowBounds);
	}
	
	public ArrayList<Review> adminReviewListG(SqlSessionTemplate sqlSession, PageInfo pi, int i){
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("supplementMapper.adminReviewListG", i, rowBounds);
	}
	
	public int adminReviewListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("supplementMapper.adminReviewListCount");
	}

	public int updateReviewCount(SqlSessionTemplate sqlSession, Review r) {
		return sqlSession.update("supplementMapper.updateReviewCount", r);
	}

	public int deleteReviewCount(SqlSessionTemplate sqlSession, Review r) {
		return sqlSession.update("supplementMapper.deleteReviewCount", r);
	}

	public int insertProduct(SqlSessionTemplate sqlSession, Supplement supple) {
		return sqlSession.insert("supplementMapper.insertProduct", supple);
	}

}
