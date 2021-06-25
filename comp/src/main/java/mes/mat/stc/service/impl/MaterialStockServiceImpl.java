package mes.mat.stc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import mes.mat.stc.service.MaterialStockService;
import mes.mat.stc.service.MaterialStockDefaultVO;
import mes.mat.stc.service.MaterialStockVO;
/**
 * @Class Name : MaterialStockServiceImpl.java
 * @Description : MaterialStock Business Implement class
 * @Modification Information
 *
 * @author materialStock
 * @since 2021-06-25
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("materialStockService")
public class MaterialStockServiceImpl extends EgovAbstractServiceImpl implements
        MaterialStockService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(MaterialStockServiceImpl.class);

    @Resource(name="materialStockMapper")
    private MaterialStockMapper materialStockDAO;
    
    //@Resource(name="materialStockDAO")
    //private MaterialStockDAO materialStockDAO;
    
    /** ID Generation */
    //@Resource(name="{egovMaterialStockIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * MATERIAL_STOCK을 등록한다.
	 * @param vo - 등록할 정보가 담긴 MaterialStockVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertMaterialStock(MaterialStockVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	materialStockDAO.insertMaterialStock(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }

    /**
	 * MATERIAL_STOCK을 수정한다.
	 * @param vo - 수정할 정보가 담긴 MaterialStockVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateMaterialStock(MaterialStockVO vo) throws Exception {
        materialStockDAO.updateMaterialStock(vo);
    }

    /**
	 * MATERIAL_STOCK을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 MaterialStockVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteMaterialStock(MaterialStockVO vo) throws Exception {
        materialStockDAO.deleteMaterialStock(vo);
    }

    /**
	 * MATERIAL_STOCK을 조회한다.
	 * @param vo - 조회할 정보가 담긴 MaterialStockVO
	 * @return 조회한 MATERIAL_STOCK
	 * @exception Exception
	 */
    public MaterialStockVO selectMaterialStock(MaterialStockVO vo) throws Exception {
        MaterialStockVO resultVO = materialStockDAO.selectMaterialStock(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * MATERIAL_STOCK 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return MATERIAL_STOCK 목록
	 * @exception Exception
	 */
    public List<?> selectMaterialStockList(MaterialStockDefaultVO searchVO) throws Exception {
        return materialStockDAO.selectMaterialStockList(searchVO);
    }

    /**
	 * MATERIAL_STOCK 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return MATERIAL_STOCK 총 갯수
	 * @exception
	 */
    public int selectMaterialStockListTotCnt(MaterialStockDefaultVO searchVO) {
		return materialStockDAO.selectMaterialStockListTotCnt(searchVO);
	}
    
}
