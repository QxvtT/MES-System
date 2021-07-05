package mes.sal.out.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import mes.sal.out.service.ItemHistoryDefaultVO;
import mes.sal.out.service.ItemHistoryService;
import mes.sal.out.service.ItemHistoryVO;
/**
 * @Class Name : ItemHistoryServiceImpl.java
 * @Description : ItemHistory Business Implement class
 * @Modification Information
 *
 * @author seongwon
 * @since 2021-06-29
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("itemHistoryService")
public class ItemHistoryServiceImpl extends EgovAbstractServiceImpl implements
        ItemHistoryService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(ItemHistoryServiceImpl.class);

    @Resource(name="itemHistoryMapper")
    private ItemHistoryMapper itemHistoryDAO;
    
    //@Resource(name="itemHistoryDAO")
    //private ItemHistoryDAO itemHistoryDAO;
    
    /** ID Generation */
    //@Resource(name="{egovItemHistoryIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

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
    public void updateItemHistory(ItemHistoryVO vo) throws Exception {
        itemHistoryDAO.updateItemHistory(vo);
    }

    /**
	 * ITEM_HISTORY을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 ItemHistoryVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteItemHistory(ItemHistoryVO vo) throws Exception {
        itemHistoryDAO.deleteItemHistory(vo);
    }

    /**
	 * ITEM_HISTORY을 조회한다.
	 * @param vo - 조회할 정보가 담긴 ItemHistoryVO
	 * @return 조회한 ITEM_HISTORY
	 * @exception Exception
	 */
    public ItemHistoryVO selectItemHistory(ItemHistoryVO vo) throws Exception {
        ItemHistoryVO resultVO = itemHistoryDAO.selectItemHistory(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * ITEM_HISTORY 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return ITEM_HISTORY 목록
	 * @exception Exception
	 */
    public List<?> selectItemHistoryList(ItemHistoryVO searchVO) throws Exception {
        return itemHistoryDAO.selectItemHistoryList(searchVO);
    }
    public List<?> ItemHisNumList(ItemHistoryVO searchVO) throws Exception {
        return itemHistoryDAO.ItemHisNumList(searchVO);
    }
    public List<?> ItemHistoryRegist(ItemHistoryVO searchVO) throws Exception {
        return itemHistoryDAO.ItemHistoryRegist(searchVO);
    }
    
    public void ItemHistoryUpdate(ItemHistoryVO searchVO) throws Exception {
        itemHistoryDAO.ItemHistoryUpdate(searchVO);
    }
    
    public void InsertItemHistory(ItemHistoryVO searchVO) throws Exception {
        itemHistoryDAO.insertItemHistory(searchVO);
    }
    
    
    
    
    /**
	 * ITEM_HISTORY 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return ITEM_HISTORY 총 갯수
	 * @exception
	 */
    public int selectItemHistoryListTotCnt(ItemHistoryDefaultVO searchVO) {
		return itemHistoryDAO.selectItemHistoryListTotCnt(searchVO);
	}
    
}
