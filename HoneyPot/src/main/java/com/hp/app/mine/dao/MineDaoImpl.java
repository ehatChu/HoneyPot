package com.hp.app.mine.dao;

import java.util.List;
import java.util.Map;

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
	public List<MineVo> getAllList(SqlSessionTemplate sst, PageVo pv) {
		RowBounds rb = new RowBounds(pv.getOffset(),pv.getBoardLimit());
		return sst.selectList("mine.getAllListAdmin",null,rb);
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

	//관리자 사유물 상세조회
	@Override
	public MineVo getDetailAdmin(SqlSessionTemplate sst, int no) {
		MineVo mvo = null;
		try {
			mvo  = sst.selectOne("mine.getDetailAdmin",no);
		} catch (Exception e) {
			e.printStackTrace();
		}
				
		return mvo; 
	}

	//전체검색
	@Override
	public List<MineVo> searchAllList(SqlSessionTemplate sst, Map<String, String> searchValueMap) {
		List<MineVo> mvoList =null;
		try {
			mvoList = sst.selectList("mine.searchAllList",searchValueMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mvoList;
	}
	 
	
	
	
}
