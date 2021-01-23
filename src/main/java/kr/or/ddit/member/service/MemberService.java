package kr.or.ddit.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.common.model.PageVo_S;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.repository.MemberDao;
import kr.or.ddit.member.repository.MemberDaoI;

public class MemberService implements MemberServiceI{
	
	MemberDaoI memberDao = new MemberDao();

	@Override
	public MemberVo selectMember(String id) {
		
		return memberDao.selectMember(id);
	}

	@Override
	public int selectAllCnt() {
		return memberDao.selectAllCnt();
	}

	@Override
	public List<MemberVo> selectPagingMember(PageVo vo) {
		return memberDao.selectPagingMember(vo);
	}

	@Override
	public int memberRegist(MemberVo member) {
		return memberDao.memberRegist(member);
	}

	@Override
	public int memberUpdate(MemberVo member) {
		return memberDao.memberUpdate(member);
	}

	@Override
	public int memberDelete(String id) {
		return memberDao.memberDelete(id);
	}

	@Override
	public Map<String, Object> searchMemberid(PageVo_S vo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<MemberVo> memberList = memberDao.searchMemberid(vo);
		int cnt = memberDao.searchMemberidCnt(vo.getS_value());
		
		map.put("memberList", memberList);
		map.put("cnt", cnt);
		
		return map;
		
	}

	@Override
	public Map<String, Object> searchMembernm(PageVo_S vo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<MemberVo> memberList = memberDao.searchMembernm(vo);
		int cnt = memberDao.searchMembernmCnt(vo.getS_value());
		
		map.put("memberList", memberList);
		map.put("cnt", cnt);
		
		return map;
	}

	@Override
	public Map<String, Object> searchMemberalias(PageVo_S vo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<MemberVo> memberList = memberDao.searchMemberalias(vo);
		int cnt = memberDao.searchMemberaliasCnt(vo.getS_value());
		
		map.put("memberList", memberList);
		map.put("cnt", cnt);
		return map;
	}


	
	
}
