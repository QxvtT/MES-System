package mes.mat.in.service.impl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import mes.mat.in.service.GridDataVO;
import mes.mat.in.service.MaterialHistoryDefaultVO;
import mes.mat.in.service.MaterialHistoryService;
import mes.mat.in.service.MaterialHistoryVO;
import mes.mat.stc.service.MaterialStockVO;
/**
 * @Class Name : MaterialHistoryServiceImpl.java
 * @Description : MaterialHistory Business Implement class
 * @Modification Information
 *
 * @author materialHistory
 * @since 2021-06-28
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("materialHistoryService")
public class MaterialHistoryServiceImpl extends EgovAbstractServiceImpl implements
        MaterialHistoryService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(MaterialHistoryServiceImpl.class);

    @Resource(name="materialHistoryMapper")
    private MaterialHistoryMapper materialHistoryDAO;
    
    //@Resource(name="materialHistoryDAO")
    //private MaterialHistoryDAO materialHistoryDAO;
    
    /** ID Generation */
    //@Resource(name="{egovMaterialHistoryIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

    public MaterialHistoryVO selectMaterialHistory(MaterialHistoryVO vo) throws Exception {
        MaterialHistoryVO resultVO = materialHistoryDAO.selectMaterialHistory(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    public List<?> selectMatInList(MaterialHistoryVO searchVO) throws Exception {
        return materialHistoryDAO.selectMatInList(searchVO);
    } 
    // 자재 입고 조회
    
    public List<?> selectMatOutMng(MaterialHistoryVO searchVO) throws Exception{
    	return materialHistoryDAO.selectMatOutMng(searchVO);
    }
	// 자재 출고 관리 조회
    
    public List<?> selectMatInMng(MaterialHistoryVO searchVO) throws Exception {
    	return materialHistoryDAO.selectMatInMng(searchVO);
    }
	// 자재 입고 관리 조회
    
    public List<?> matInDayList(MaterialHistoryVO searchVO) throws Exception {
    	return materialHistoryDAO.matInDayList(searchVO);
    }
    // 일 입고 리스트 조회
    
    public int selectMaterialHistoryListTotCnt(MaterialHistoryDefaultVO searchVO) {
		return materialHistoryDAO.selectMaterialHistoryListTotCnt(searchVO);
	}
    
    // 자재 입고 관리 CUD
	@Override
	public void updateMatIn(GridDataVO gridDataVO) throws Exception {
		if(gridDataVO.getUpdatedRows() != null) {
			for(int i =0; i<gridDataVO.getUpdatedRows().size(); i++) {
				materialHistoryDAO.updateMatIn(gridDataVO.getUpdatedRows().get(i));
			}
		}
		if(gridDataVO.getCreatedRows() != null) {
			if(gridDataVO.getMaterialHistoryVO().getMatHisNum() != null) {
				for(int i = 0; i<gridDataVO.getCreatedRows().size(); i++) {
					MaterialHistoryVO matVO = gridDataVO.getCreatedRows().get(i);
					matVO.setMatHisDate(gridDataVO.getMaterialHistoryVO().getMatHisDate());
					matVO.setMatCode(gridDataVO.getMaterialHistoryVO().getMatCode());
					matVO.setMatHisDVol(gridDataVO.getMaterialHistoryVO().getMatHisDVol());
					matVO.setMatHisPrice(gridDataVO.getMaterialHistoryVO().getMatHisPrice());
					materialHistoryDAO.insertMatIn(matVO);
				}
			}
			
		}
		if(gridDataVO.getDeletedRows() != null) {
			for(int i = 0; i<gridDataVO.getDeletedRows().size(); i++) {
				materialHistoryDAO.deleteMatIn(gridDataVO.getDeletedRows().get(i));
			}
		}
	}
	// end 자재 입고 관리 CUD
	
	public int getCount(MaterialHistoryVO searchVO) {
		return materialHistoryDAO.getCount(searchVO);
	}

}
