package mes.mat.in.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import mes.mat.in.service.MaterialHistoryDDefaultVO;
import mes.mat.in.service.MaterialHistoryDService;
import mes.mat.in.service.MaterialHistoryDVO;
/**
 * @Class Name : MaterialHistoryDServiceImpl.java
 * @Description : MaterialHistoryD Business Implement class
 * @Modification Information
 *
 * @author soyeon
 * @since 20210625
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("materialHistoryDService")
public class MaterialHistoryDServiceImpl extends EgovAbstractServiceImpl implements
        MaterialHistoryDService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(MaterialHistoryDServiceImpl.class);

    @Resource(name="materialHistoryDMapper")
    private MaterialHistoryDMapper materialHistoryDDAO;
    
    //@Resource(name="materialHistoryDDAO")
    //private MaterialHistoryDDAO materialHistoryDDAO;
    
    /** ID Generation */
    //@Resource(name="{egovMaterialHistoryDIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * MATERIAL_HISTORY_D을 등록한다.
	 * @param vo - 등록할 정보가 담긴 MaterialHistoryDVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertMaterialHistoryD(MaterialHistoryDVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	materialHistoryDDAO.insertMaterialHistoryD(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }

    /**
	 * MATERIAL_HISTORY_D을 수정한다.
	 * @param vo - 수정할 정보가 담긴 MaterialHistoryDVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateMaterialHistoryD(MaterialHistoryDVO vo) throws Exception {
        materialHistoryDDAO.updateMaterialHistoryD(vo);
    }

    /**
	 * MATERIAL_HISTORY_D을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 MaterialHistoryDVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteMaterialHistoryD(MaterialHistoryDVO vo) throws Exception {
        materialHistoryDDAO.deleteMaterialHistoryD(vo);
    }

    /**
	 * MATERIAL_HISTORY_D을 조회한다.
	 * @param vo - 조회할 정보가 담긴 MaterialHistoryDVO
	 * @return 조회한 MATERIAL_HISTORY_D
	 * @exception Exception
	 */
    public MaterialHistoryDVO selectMaterialHistoryD(MaterialHistoryDVO vo) throws Exception {
        MaterialHistoryDVO resultVO = materialHistoryDDAO.selectMaterialHistoryD(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * MATERIAL_HISTORY_D 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return MATERIAL_HISTORY_D 목록
	 * @exception Exception
	 */
    public List<?> selectMaterialHistoryDList(MaterialHistoryDDefaultVO searchVO) throws Exception {
        return materialHistoryDDAO.selectMaterialHistoryDList(searchVO);
    }

    /**
	 * MATERIAL_HISTORY_D 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return MATERIAL_HISTORY_D 총 갯수
	 * @exception
	 */
    public int selectMaterialHistoryDListTotCnt(MaterialHistoryDDefaultVO searchVO) {
		return materialHistoryDDAO.selectMaterialHistoryDListTotCnt(searchVO);
	}
    
}
