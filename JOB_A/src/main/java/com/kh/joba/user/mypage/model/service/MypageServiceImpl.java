package com.kh.joba.user.mypage.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.joba.user.mypage.model.dao.MypageDAO;

@Service
public class MypageServiceImpl implements MypageService {

	@Autowired
	MypageDAO md;
	
	@Override
	public List<Map<String, String>> selectMyPost(int cPage, int numPerPage, int mem_No) {
		return md.selectMyPost(cPage, numPerPage, mem_No);
	}


	@Override
	public int selectMyPostTotalContents(int mem_No) {
		return md.selectMyPostTotalContents(mem_No);
	}


}
