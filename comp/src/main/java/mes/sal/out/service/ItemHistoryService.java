package mes.sal.out.service;

import java.util.List;
import mes.sal.out.service.ItemHistoryDefaultVO;
import mes.sal.out.service.ItemHistoryVO;

/**
 * @Class Name : ItemHistoryService.java
 * @Description : ItemHistory Business class
 * @Modification Information
 *
 * @author seongwon
 * @since 2021-06-29
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface ItemHistoryService {
	
	/**
	 * ITEM_HISTORY을 등록한다.
	 * @param vo - 등록할 정보가 담긴 ItemHistoryVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    String insertItemHistory(ItemHistoryVO vo) throws Exception;
    
    /**
	 * ITEM_HISTORY을 수정한다.
	 * @param vo - 수정할 정보가 담긴 ItemHistoryVO
	 * @return void형
	 * @exception Exception
	 */
    void updateItemHistory(ItemHistoryVO vo) throws Exception;
    
    /**
	 * ITEM_HISTORY을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 ItemHistoryVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteItemHistory(ItemHistoryVO vo) throws Exception;
    
    /**
	 * ITEM_HISTORY을 조회한다.
	 * @param vo - 조회할 정보가 담긴 ItemHistoryVO
	 * @return 조회한 ITEM_HISTORY
	 * @exception Exception
	 */
    ItemHistoryVO selectItemHistory(ItemHistoryVO vo) throws Exception;
    
    /**
	 * ITEM_HISTORY 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return ITEM_HISTORY 목록
	 * @exception Exception
	 */
    List selectItemHistoryList(ItemHistoryVO searchVO) throws Exception;
    List ItemHisNumList(ItemHistoryVO searchVO) throws Exception;
    
    /**
	 * ITEM_HISTORY 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return ITEM_HISTORY 총 갯수
	 * @exception
	 */
    int selectItemHistoryListTotCnt(ItemHistoryDefaultVO searchVO);
    
}
