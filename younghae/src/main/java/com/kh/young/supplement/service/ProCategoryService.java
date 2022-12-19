package com.kh.young.supplement.service;

import java.util.ArrayList;

import com.kh.young.model.vo.PageInfo;
import com.kh.young.model.vo.ProCategory;

public interface ProCategoryService {

	int getListCount();

	ArrayList<ProCategory> allCategory(PageInfo pi);

	ProCategory selectCategory(int cateNum);

}
