package kr.or.ddit.member.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.member.model.MemberVo;

public class MemberServiceTest {
	
	private MemberServiceI service;
	private static final Logger logger = LoggerFactory.getLogger(MemberServiceTest.class);
	
	@Test
	public void selectMemberTest() {
		
		/***Given***/
		service = new MemberService();
		String id="brown";
		
		/***When***/
		MemberVo member = service.selectMember(id);
		
		/***Then***/
		assertEquals("브라운", member.getUsernm());
	}

}
