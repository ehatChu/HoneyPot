package com.hp.app.mine.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hp.app.member.vo.MemberVo;
import com.hp.app.mine.vo.MineVo;
import com.hp.app.page.vo.PageVo;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class MineDaoImpl implements MineDao {

	@Override
	public int registerCar(SqlSessionTemplate sst,MineVo mvo) {
		return sst.insert("mine.registerCar",mvo);
	}


	@Override
	public List<MineVo> getAllList(SqlSessionTemplate sst, PageVo pvo) {
		RowBounds rb = new RowBounds(pvo.getOffset(),pvo.getBoardLimit());
		return sst.selectList("mine.getAllListAdmin",rb);
	}
	
	/*페이징 처리를 안한, pvo를 안받는, 개인조회를 위해 이름만 같은 오버로딩을 사용 pvo를 없애줌*/
	@Override
	public List<MineVo> getAllList(SqlSessionTemplate sst, MemberVo loginMember) {
		return sst.selectList("mine.getAllListMember",loginMember);
	}
	

	@Override
	public int getAllCnt(SqlSessionTemplate sst) {
		return sst.selectOne("mine.getAllCnt");
	}


	@Override
	public int registerBicycle(SqlSessionTemplate sst, MineVo mvo) {
		return sst.insert("mine.registerBicycle",mvo);
	}
	 
	
	
}
