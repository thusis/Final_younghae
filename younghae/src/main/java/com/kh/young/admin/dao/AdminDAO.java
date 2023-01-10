package com.kh.young.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.young.model.vo.Attachment;
import com.kh.young.model.vo.Board;
import com.kh.young.model.vo.Coupon;
import com.kh.young.model.vo.Declaration;
import com.kh.young.model.vo.ExpertUser;
import com.kh.young.model.vo.GeneralUser;
import com.kh.young.model.vo.Member;
import com.kh.young.model.vo.PageInfo;

@Repository
public class AdminDAO {

	public ArrayList<Coupon> selectAdminCoupon(SqlSessionTemplate sqlSession, int id) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("adminMapper.selectAdminCoupon", id);
	}

	public int alertCouponCa(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {

		return sqlSession.update("adminMapper.alertCouponCa", map);
	}

	public int alertCouponRe(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.update("adminMapper.alertCouponRe", map);
		
	}

	public int createCoupon(SqlSessionTemplate sqlSession, Coupon c) {
		// TODO Auto-generated method stub
		return sqlSession.insert("adminMapper.createCoupon", c);
	}

	public ArrayList<Member> selectAllMember(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("adminMapper.selectAllMember");
	}

	public Member selectMember(SqlSessionTemplate sqlSession, int id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.selectMember", id);
	}

	public ExpertUser selectExpert(SqlSessionTemplate sqlSession, int id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.selectExpert", id);
	}

	public GeneralUser selectGeneral(SqlSessionTemplate sqlSession, int id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.selectGeneral", id);
	}

	public int deleteMember(SqlSessionTemplate sqlSession, int id) {
		// TODO Auto-generated method stub
		return sqlSession.update("adminMapper.deleteMember", id);
	}

	public int updateMember(SqlSessionTemplate sqlSession, int id) {
		// TODO Auto-generated method stub
		return sqlSession.update("adminMapper.updateMember", id);
	}

	public Attachment selectProfile(SqlSessionTemplate sqlSession, int id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.selectProfile", id);
	}
	
    /**===============신고========================== **/
   public ArrayList<HashMap> selectAdminDeclare(SqlSessionTemplate sqlSession, PageInfo pi) {
      int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
      ArrayList<Declaration> list = (ArrayList)sqlSession.selectList("adminMapper.selectAdminDeclare", null, rowBounds);
      ArrayList<HashMap> resultList = new ArrayList();
      
      for(Declaration d : list) {
         HashMap<String, Object> map = new HashMap<>();
         Board b = sqlSession.selectOne("adminMapper.selectBoardContent",d.getBoardNum());
         map.put("declaration", d);
         map.put("board", b);
         resultList.add(map);
      }
      
      return resultList;
   }

   public int getDeclareListCount(SqlSessionTemplate sqlSession) {
      return sqlSession.selectOne("adminMapper.getDeclareListCount");
   }

   public int deleteDeclaredBoard(SqlSessionTemplate sqlSession, int boardNum) {
      return sqlSession.update("adminMapper.deleteDeclaredBoard", boardNum);
   }

   public int updateDeclareStatus(SqlSessionTemplate sqlSession, int declNum) {
      return sqlSession.update("adminMapper.updateDeclareStatus", declNum);
   }
	

}
