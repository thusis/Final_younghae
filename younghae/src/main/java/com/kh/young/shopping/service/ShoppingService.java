package com.kh.young.shopping.service;

import java.util.ArrayList;

import com.kh.young.model.vo.Supplement;

public interface ShoppingService {

	ArrayList<Supplement> selectSupplementList();

	ArrayList<Supplement> selectTrendList();

}
