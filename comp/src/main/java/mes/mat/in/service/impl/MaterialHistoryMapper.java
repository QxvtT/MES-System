package mes.mat.in.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import mes.mat.in.service.MaterialHistoryDefaultVO;
import mes.mat.in.service.MaterialHistoryVO;

/**
 * @Class Name : MaterialHistoryMapper.java
 * @Description : MaterialHistory Mapper Class
 * @Modification Information
 *
 * @author materialHistory
 * @since 2021-06-28
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Mapper("materialHistoryMapper")
public interface MaterialHistoryMapper {

    /**
	 * MATERIAL_HISTORY을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 MaterialHistoryVO
	 * @return void형 
	 * @exception Exception
	 */
    public MaterialHistoryVO selectMaterialHistory(MaterialHistoryVO vo) throws Exception;

    /**
	 * MATERIAL_HISTORY 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return MATERIAL_HISTORY 목록
	 * @exception Exception
	 */
    public List<?> selectMatInList(MaterialHistoryVO searchVO) throws Exception; // 자재 입고 조회

    List selectMatInMng(MaterialHistoryVO searchVO) throws Exception; // 자재 입고 관리 조회
    
    public List<?> selectMatOutMng(MaterialHistoryVO searchVO) throws Exception; // 자재 출고 관리 조회
    
    public List<?> matInDayList(MaterialHistoryVO searchVO) throws Exception; // 일 입고 자료 리스트 조회
    
    public List<?> nordList(MaterialHistoryVO searchVO) throws Exception; // 미입고 자료 리스트 조회
    
    public List<?> matOutDayList(MaterialHistoryVO searchVO) throws Exception; // 일 출고 자료 리스트 조회
    
    public void insertMatInMng(MaterialHistoryVO vo) throws Exception;
    public void insertMatInMngD(MaterialHistoryVO vo) throws Exception; // 자재 입고 관리 등록
    
    public void updateMatInMng(MaterialHistoryVO vo) throws Exception;
    public void updateMatInMngD(MaterialHistoryVO vo) throws Exception; // 자재 입고 관리 그리드 행 수정
    
    public void deleteMatInMngD(MaterialHistoryVO vo) throws Exception; // 자재 입고 관리 행 삭제
    
    public int getMatInMngCount(MaterialHistoryVO searchVO) throws Exception; // 입고 번호 count
    
    public int selectMaterialHistoryListTotCnt(MaterialHistoryDefaultVO searchVO);
	
    
}
