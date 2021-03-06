package mes.sal.out.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import mes.sal.out.service.ItemHistoryDefaultVO;
import mes.sal.out.service.ItemHistoryVO;

/**
 * @Class Name : ItemHistoryMapper.java
 * @Description : ItemHistory Mapper Class
 * @Modification Information
 *
 * @author seongwon
 * @since 2021-06-29
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Mapper("itemHistoryMapper")
public interface ItemHistoryMapper {

	/**
	 * ITEM_HISTORY을 등록한다.
	 * @param vo - 등록할 정보가 담긴 ItemHistoryVO
	 * @return 등록 결과
	 * @exception Exception
	 */

    /**
	 * ITEM_HISTORY을 수정한다.
	 * @param vo - 수정할 정보가 담긴 ItemHistoryVO
	 * @return void형
	 * @exception Exception
	 */
    public void insertItemHistory(ItemHistoryVO vo) throws Exception;
    public void itemHistoryNewInsert(ItemHistoryVO vo) throws Exception;
    public void updateItemHistory(ItemHistoryVO vo) throws Exception;
    public void deleteItemHistory(ItemHistoryVO vo) throws Exception;
    public void itemHistoryMaster(ItemHistoryVO vo) throws Exception;
    
    
    
    
    /**
	 * ITEM_HISTORY을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 ItemHistoryVO
	 * @return void형 
	 * @exception Exception
	 */

    /**
	 * ITEM_HISTORY을 조회한다.
	 * @param vo - 조회할 정보가 담긴 ItemHistoryVO
	 * @return 조회한 ITEM_HISTORY
	 * @exception Exception
	 */
    public ItemHistoryVO selectItemHistory(ItemHistoryVO vo) throws Exception;

    /**
	 * ITEM_HISTORY 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return ITEM_HISTORY 목록
	 * @exception Exception
	 */
    public List<?> selectItemHistoryList(ItemHistoryDefaultVO searchVO) throws Exception;
    public List<?> ItemHisNumList(ItemHistoryDefaultVO searchVO) throws Exception;
    public List<?> ItemHistoryRegist(ItemHistoryDefaultVO searchVO) throws Exception;
    public List<?> setLotNum(ItemHistoryVO searchVO) throws Exception;
    public List<?> setOrdNum(ItemHistoryVO searchVO) throws Exception;
    public List<?> setItemCode(ItemHistoryVO searchVO) throws Exception;
    public List<?> setItemCodeA(ItemHistoryVO searchVO) throws Exception;
    public List<?> getItmHisNum(ItemHistoryVO searchVO) throws Exception;
    
    /**
	 * ITEM_HISTORY 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return ITEM_HISTORY 총 갯수
	 * @exception
	 */
    public int selectItemHistoryListTotCnt(ItemHistoryDefaultVO searchVO);
    public int setOrdCheck(ItemHistoryVO searchVO);
    
    public String getCount(ItemHistoryDefaultVO searchVO);

}
