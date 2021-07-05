package mes.mat.in.service.impl;

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

    /**
	 * MATERIAL_HISTORY을 조회한다.
	 * @param vo - 조회할 정보가 담긴 MaterialHistoryVO
	 * @return 조회한 MATERIAL_HISTORY
	 * @exception Exception
	 */
    public MaterialHistoryVO selectMaterialHistory(MaterialHistoryVO vo) throws Exception {
        MaterialHistoryVO resultVO = materialHistoryDAO.selectMaterialHistory(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * MATERIAL_HISTORY 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return MATERIAL_HISTORY 목록
	 * @exception Exception
	 */
    public List<?> selectMatInList(MaterialHistoryVO searchVO) throws Exception {
        return materialHistoryDAO.selectMatInList(searchVO);
    } // 자재 입고 조회

    /**
	 * MATERIAL_HISTORY 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return MATERIAL_HISTORY 총 갯수
	 * @exception
	 */
    
    public List<?> selectMatOutMng(MaterialHistoryVO searchVO) throws Exception{
    	return materialHistoryDAO.selectMatOutMng(searchVO);
    } // 자재 출고 관리 조회
    
    public List<?> selectMatInMng(MaterialHistoryVO searchVO) throws Exception {
    	return materialHistoryDAO.selectMatInMng(searchVO);
    	// 자재 입고 관리 조회
    }
    
    public int selectMaterialHistoryListTotCnt(MaterialHistoryDefaultVO searchVO) {
		return materialHistoryDAO.selectMaterialHistoryListTotCnt(searchVO);
	}

	@Override
	public void updateMatIn(GridDataVO gridDataVO) throws Exception {
		if(gridDataVO.getUpdatedRows() != null) {
			for(int i =0; i<gridDataVO.getUpdatedRows().size(); i++) {
				materialHistoryDAO.updateMatIn(gridDataVO.getUpdatedRows().get(i));
			}
		}
		if(gridDataVO.getUpdatedRows() != null) {
			for(int i = 0; i<gridDataVO.getUpdatedRows().size(); i++) {
				MaterialHistoryVO matVO = gridDataVO.getCreatedRows().get(i);
				matVO.setMatHisDate(gridDataVO.getMaterialStockVO().getMatHisDate());
				matVO.setMatOutOper(gridDataVO.getMaterialStockVO().getMatOutOper());
				materialHistoryDAO.insertMatIn(matVO);
			}
		}
		if(gridDataVO.getUpdatedRows() != null) {
			for(int i = 0; i<gridDataVO.getUpdatedRows().size(); i++) {
				materialHistoryDAO.deleteMatIn(gridDataVO.getDeletedRows().get(i));
			}
		}
	}

}
