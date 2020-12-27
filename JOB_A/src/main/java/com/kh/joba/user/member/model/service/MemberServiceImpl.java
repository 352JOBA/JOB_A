package com.kh.joba.user.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.joba.user.member.model.dao.MemberDAO;
import com.kh.joba.user.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO memberDAO;
	
	// 회원가입 
	@Override
	public int insertMember(Member member) {

		return memberDAO.insertMember(member);
	}

	// 회원 로그인 
	@Override
	public Member selectOneMember(String memId) {
	
		return memberDAO.selectOneMember(memId);
	}

	// 회원 정보 수정
	@Override
	public int updateMember(Member member) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 아이디 중복 확인
	@Override
	public int checkIdDuplicate(String memId) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 회원정보 삭제-탈퇴
	@Override
	public int deleteMember(String memId) {
		// TODO Auto-generated method stub
		return 0;
	}

}
