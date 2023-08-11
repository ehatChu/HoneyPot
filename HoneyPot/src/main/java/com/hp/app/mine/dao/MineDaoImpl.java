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
		int result =0;
		try {
			result = sst.insert("mine.registerCar",mvo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	//관리자 자동차 전체 조회
	@Override
	public List<MineVo> getCarList(SqlSessionTemplate sst, PageVo pv) {
		RowBounds rb = new RowBounds(pv.getOffset(),pv.getBoardLimit());
		
		List<MineVo> mvoList = null;
		try {
			mvoList = sst.selectList("mine.getCarListAdmin",null,rb);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mvoList;
	}
	
	/*페이징 처리를 안한, pvo를 안받는, 개인조회를 위해 이름만 같은 오버로딩을 사용 pvo를 없애줌*/
	@Override
	public List<MineVo> getCarList(SqlSessionTemplate sst, MemberVo loginMember) {
		return sst.selectList("mine.getCarListMember",loginMember);
	}
	

	@Override
	public int getCarCnt(SqlSessionTemplate sst,Map<String, String> map) {
		int result=0;
		try {
			result =sst.selectOne("mine.getCarCnt",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}


	@Override
	public int registerBicycle(SqlSessionTemplate sst, MineVo mvo) {
		return sst.insert("mine.registerBicycle",mvo);
	}

	//관리자 사유물 상세조회
	@Override
	public MineVo getDetailAdmin(SqlSessionTemplate sst,Map<String, String> map) {
		MineVo mvo = null;
		try {
			mvo  = sst.selectOne("mine.getDetailAdmin",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
				
		return mvo; 
	}

	//전체검색
	@Override
	public List<MineVo> searchAllList(SqlSessionTemplate sst, Map<String, String> searchValueMap,PageVo pv) {
		List<MineVo> mvoList =null;
		try {
			RowBounds rb = new RowBounds(pv.getOffset(),pv.getBoardLimit());
			mvoList = sst.selectList("mine.searchAllList",searchValueMap,rb);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mvoList;
	}

	//관리자 권한 사유물 삭제
	@Override
	public int deleteProperty(SqlSessionTemplate sst,Map<String, String> map) {
		return sst.delete("mine.deleteProperty",map);
	}
	//승인
	@Override
	public int acceptPropertyList(SqlSessionTemplate sst, Map<String, Object> infoMap) {
		int result=0;
		try {
			result= sst.update("mine.acceptPropertyList",infoMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	//개인삭제
	@Override
	public int deletePersonalProperty(SqlSessionTemplate sst, Map<String, Object> infoMap) {
		int result=0;
		try {
			result= sst.update("mine.deletePersonalProperty",infoMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	//개인 자전거 목록
	@Override
	public List<MineVo> getBicycleListMember(SqlSessionTemplate sst, MemberVo loginMember) {
		List<MineVo> bicycleList= null;
		try {
			bicycleList = sst.selectList("mine.getBicycleListMember",loginMember);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bicycleList;
	}
	 
	
	
	
}
