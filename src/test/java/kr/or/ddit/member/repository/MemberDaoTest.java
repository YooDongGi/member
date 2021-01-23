package kr.or.ddit.member.repository;


import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.member.model.MemberVo;

public class MemberDaoTest {

	private MemberDaoI dao;
	private static final Logger logger = LoggerFactory.getLogger(MemberDaoTest.class);
	
	@Test
	public void selectMemberTest() {
		
		/***Given***/
		String id="brown";
		dao = new MemberDao();
		System.out.println(id);
		
		/***When***/
		MemberVo member = dao.selectMember(id);
		
		/***Then***/
		assertEquals("브라운", member.getUsernm());
	}

}
