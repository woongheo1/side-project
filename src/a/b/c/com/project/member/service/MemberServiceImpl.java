package a.b.c.com.project.member.service;

import java.util.List;



import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import a.b.c.com.project.member.dao.MemberDAO;
import a.b.c.com.project.member.vo.MemberVO;

@Service("memberServiceImpl")
@Transactional
public class MemberServiceImpl implements MemberService {
    private Logger logger = LogManager.getLogger(MemberServiceImpl.class);
    
    @Autowired // @Qualifier를 사용하지 않고 직접 필드의 이름과 빈의 이름을 일치시킵니다.
    private MemberDAO memberDAO;

    @Override
    public int MemberInsert(MemberVO mvo) {
        logger.info("MemberInsert() 함수 진입 >>> : ");
        return memberDAO.MemberInsert(mvo);
    }

    @Override
    public List<MemberVO> MemberSelectAll(MemberVO mvo) {
        logger.info("MemberSelectAll() 함수 진입 >>> : ");
        return memberDAO.MemberSelectAll(mvo);
    }
    
    @Override
    public List<MemberVO> MemberSelect(MemberVO mvo) {
        logger.info("MemberSelect() 함수 진입 >>> : ");
        return memberDAO.MemberSelect(mvo);
    }

    @Override
    public List<MemberVO> IdCheck(MemberVO mvo) {
        logger.info("kosIdCheck() 함수 진입 >>> : ");
        return memberDAO.kosIdCheck(mvo);
    }

    @Override
    public int MemberUpdate(MemberVO mvo) {
        logger.info("MemberUpdate() 함수 진입 >>> : "); 
        return memberDAO.MemberUpdate(mvo);
    }

    @Override
    public int MemberDelete(MemberVO mvo) {
        logger.info("MemberDelete() 함수 진입 >>> : ");
        return memberDAO.MemberDelete(mvo);
    }

	@Override
	public List<MemberVO> NickCheck(MemberVO mvo) {
		// TODO Auto-generated method stub
		return memberDAO.NickCheck(mvo);
	}
}
