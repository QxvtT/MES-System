package mes.mat.in.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
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
	 * MATERIAL_HISTORY을 등록한다.
	 * @param vo - 등록할 정보가 담긴 MaterialHistoryVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertMaterialHistory(MaterialHistoryVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	materialHistoryDAO.insertMaterialHistory(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }

    /**
	 * MATERIAL_HISTORY을 수정한다.
	 * @param vo - 수정할 정보가 담긴 MaterialHistoryVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateMaterialHistory(MaterialHistoryVO vo) throws Exception {
        materialHistoryDAO.updateMaterialHistory(vo);
    }

    /**
	 * MATERIAL_HISTORY을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 MaterialHistoryVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteMaterialHistory(MaterialHistoryVO vo) throws Exception {
        materialHistoryDAO.deleteMaterialHistory(vo);
    }

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
    
}
