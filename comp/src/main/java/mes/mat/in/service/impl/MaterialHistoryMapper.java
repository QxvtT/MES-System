package mes.mat.in.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import mes.mat.in.service.GridDataVO;
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

    public List<?> selectMatOutMng(MaterialHistoryVO searchVO) throws Exception; // 자재 출고 관리 조회
    
    List selectMatInMng(MaterialHistoryVO searchVO) throws Exception; // 자재 입고 관리 조회
    
    public void insertMatIn(MaterialHistoryVO materialHisoryVO) throws Exception;
    public void updateMatIn(MaterialHistoryVO materialHisoryVO) throws Exception;
    public void deleteMatIn(MaterialHistoryVO materialHisoryVO) throws Exception;
    
    public int selectMaterialHistoryListTotCnt(MaterialHistoryDefaultVO searchVO);
    
}
