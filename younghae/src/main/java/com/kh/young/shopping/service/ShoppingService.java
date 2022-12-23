package com.kh.young.shopping.service;

import java.util.ArrayList;

import com.kh.young.model.vo.GeneralUser;
import com.kh.young.model.vo.Member;
import com.kh.young.model.vo.Supplement;

public interface ShoppingService {

	Member selectMember(int i);
	ArrayList<GeneralUser> selectGu(int i);
	
	ArrayList<Supplement> selectSupplementList();

	ArrayList<Supplement> selectTrendList();

	ArrayList<Supplement> selectBestsellerList();

	Supplement selectDetail(int proNum);



}
