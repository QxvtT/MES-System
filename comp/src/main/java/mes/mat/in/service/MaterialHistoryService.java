package mes.mat.in.service;

import java.util.List;

import mes.mat.stc.service.MaterialStockVO;

/**
 * @Class Name : MaterialHistoryService.java
 * @Description : MaterialHistory Business class
 * @Modification Information
 *
 * @author materialHistory
 * @since 2021-06-28
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface MaterialHistoryService {
	
    MaterialHistoryVO selectMaterialHistory(MaterialHistoryVO vo) throws Exception;
    
    /**
	 * MATERIAL_HISTORY 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return MATERIAL_HISTORY 목록
	 * @exception Exception
	 */
    int selectMaterialHistoryListTotCnt(MaterialHistoryDefaultVO searchVO);
    
    List selectMatInList(MaterialHistoryVO searchVO) throws Exception; // 자재 입고 조회
    
    List selectMatOutMng(MaterialHistoryVO searchVO) throws Exception; // 자재 출고 관리 조회
    
    List selectMatInMng(MaterialHistoryVO searchVO) throws Exception; // 자재 입고 관리 조회
    
    List matInDayList(MaterialHistoryVO searchVO) throws Exception; // 일 입고자료 리스트
    
    List matOutDayList(MaterialHistoryVO searchVO) throws Exception; // 일 입고자료 리스트
    
    void updateMatIn(GridDataVO gridDataVO) throws Exception; // ajax CRUD
    
    int getCount(MaterialHistoryVO searchVO);
    
}
