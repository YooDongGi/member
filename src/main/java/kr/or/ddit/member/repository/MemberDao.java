package kr.or.ddit.member.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.common.model.PageVo_S;
import kr.or.ddit.db.MybatisUtil;
import kr.or.ddit.member.model.MemberVo;

public class MemberDao implements MemberDaoI{

	@Override
	public MemberVo selectMember(String id) {
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		
		MemberVo member = sqlSession.selectOne("member.selectMember", id);
		
		sqlSession.close();
		
		return member;
	}

	@Override
	public int selectAllCnt() {
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		
		int count = sqlSession.selectOne("member.selectAllCnt");
		
		sqlSession.close();
		
		return count;
	}

	@Override
	public List<MemberVo> selectPagingMember(PageVo vo) {
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		
		List<MemberVo> memberList = sqlSession.selectList("member.selectPagingMember", vo);
		
		sqlSession.close();
		
		return memberList;
	}

	@Override
	public int memberRegist(MemberVo member) {
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		
		int cnt = sqlSession.insert("member.memberRegist", member);
		if(cnt == 1) {
			sqlSession.commit();
		} else {	// 비정상적으로 동작했을 경우 rollback을 한다
			sqlSession.rollback();
		}
		
		sqlSession.close();
		return cnt;
	}

	@Override
	public int memberUpdate(MemberVo member) {
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		
		int cnt = sqlSession.update("member.memberUpdate", member);
		
		if(cnt == 1) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}
		
		sqlSession.close();
		return cnt;
	}

	@Override
	public int memberDelete(String id) {
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		
		int cnt = sqlSession.delete("member.memberDelete", id);
		
		if(cnt == 1) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}
		
		sqlSession.close();
		
		return cnt;
	}

	@Override
	public List<MemberVo> searchMemberid (PageVo_S vo) {
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		
		List<MemberVo> memberList = sqlSession.selectList("member.searchMemberid", vo);
		
		sqlSession.close();
		
		return memberList;
	}

	@Override
	public int searchMemberidCnt(String id) {
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		
		int count = sqlSession.selectOne("member.searchMemberidCnt", id);
		
		sqlSession.close();
		
		return count;
	}

	@Override
	public List<MemberVo> searchMembernm(PageVo_S vo) {
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		
		List<MemberVo> memberList = sqlSession.selectList("member.searchMembernm",vo);
		
		sqlSession.close();
		
		return memberList;
	}

	@Override
	public int searchMembernmCnt(String name) {
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		
		int count = sqlSession.selectOne("member.searchMembernmCnt", name);
		
		sqlSession.close();
		
		return count;
	}

	@Override
	public List<MemberVo> searchMemberalias(PageVo_S vo) {
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		List<MemberVo> memberList = sqlSession.selectList("member.searchMemberalias",vo);
		sqlSession.close();
		return memberList;
	}

	@Override
	public int searchMemberaliasCnt(String alias) {
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		int count = sqlSession.selectOne("member.searchMemberaliasCnt", alias);
		sqlSession.close();
		return count;
	}




}
