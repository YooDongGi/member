package kr.or.ddit.member.repository;

import java.util.List;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.common.model.PageVo_S;
import kr.or.ddit.member.model.MemberVo;

public interface MemberDaoI {

	// id에 맞는 회원정보 조회
	MemberVo selectMember(String id);
	
	// 사용자 수 조회
	int selectAllCnt();
	
	// 페이지에 맞는 사용자 정보 조회
	List<MemberVo> selectPagingMember(PageVo vo); 
	
	// 사용자 등록
	int memberRegist(MemberVo member);
	
	// 사용자 정보 수정
	int memberUpdate(MemberVo member);
	
	// 사용자 삭제
	int memberDelete(String id);
	
	// 사용자 아이디를 검색
	List<MemberVo> searchMemberid(PageVo_S vo);
	int searchMemberidCnt(String id);
	
	// 사용자 이름으로 검색
	List<MemberVo> searchMembernm(PageVo_S vo);
	int searchMembernmCnt(String name);
	
	// 사용자 별명으로 검색
	List<MemberVo> searchMemberalias(PageVo_S vo);
	int searchMemberaliasCnt(String alias);
	
}
