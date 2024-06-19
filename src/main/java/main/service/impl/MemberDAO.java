package main.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import main.service.MemberVO;

@Repository("memberDAO")

public class MemberDAO extends EgovAbstractDAO{

	public String insertMember(MemberVO vo) {
		
		return (String) insert("memberDAO.insertMember",vo);
	}

	public int selectMemberIdCheck(String userid) {
		
		return (int) select("memberDAO.selectMemberIdCheck",userid);
	}

	public List<?> selectPostList(String dong) {
		
		return list("memberDAO.selectPostList",dong);
	}

	public int selectMemberCount(MemberVO vo) {
		
		return (int) select("memberDAO.selectMemberCount",vo);
	}

}
