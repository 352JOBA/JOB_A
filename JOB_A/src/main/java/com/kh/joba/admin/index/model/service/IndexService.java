package com.kh.joba.admin.index.model.service;

import java.util.List;
import java.util.Map;

import com.kh.joba.user.board2.blahblah.model.vo.Board2;


public interface IndexService {
	
	List<Board2> selectRank();

	List<Map<String, String>> selectBoard();
}
