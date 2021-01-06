package com.kh.joba.user.member.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.joba.user.category.model.vo.WishCategory;
import com.kh.joba.user.member.model.vo.Member;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 회원가입
	@Override
	public int insertMember(Member member) {
		return sqlSession.insert("memberMapper.insertMember", member);
	}

	// 로그인
	@Override
	public Member selectOneMember(String memId) {
		Member m = sqlSession.selectOne("memberMapper.loginMember", memId);
		System.out.println("DAO Member m : " + m);
		return m;
	}

	// 회원정보 수정
	@Override
	public int updateMember(Member member) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 아이디 중복 체크
	@Override
	public Member checkIdDuplicate(String memId) {
		
		System.out.println("dao : " + memId);
		Member m = sqlSession.selectOne("memberMapper.checkIdDuplicate", memId);
		
		System.out.println("리턴 값 : " + m);
		return m;
	}

	// 회원 정보 삭제 - 탈퇴
	@Override
	public int deleteMember(String memId) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 닉네임 중복 체크
	@Override
	public Member checkNicknameDuplicate(String memNick) {
		
		System.out.println("dao : " + memNick);
		Member m= sqlSession.selectOne("memberMapper.checkNicknameDuplicate", memNick);
		
		System.out.println("리턴값 :" + m);
		return m;
	}

	// 선호 직종 삽입
	@Override
	public void insertWishCategory(int mem_No, int[] category_No) {
		
		WishCategory ws = new WishCategory(mem_No, category_No);
		
		sqlSession.insert("memberMapper.insertWishCategory", ws);
		
	}

}
