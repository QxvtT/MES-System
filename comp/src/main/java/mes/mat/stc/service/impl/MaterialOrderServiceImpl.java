package mes.mat.stc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import mes.mat.stc.service.MaterialOrderService;
import mes.mat.stc.service.MaterialOrderVO;
import mes.mat.stc.service.MaterialOrderDefaultVO;
/**
 * @Class Name : MaterialOrderServiceImpl.java
 * @Description : MaterialOrder Business Implement class
 * @Modification Information
 *
 * @author materialOrder
 * @since 2021-06-29
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("materialOrderService")
public class MaterialOrderServiceImpl extends EgovAbstractServiceImpl implements
        MaterialOrderService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(MaterialOrderServiceImpl.class);

    @Resource(name="materialOrderMapper")
    private MaterialOrderMapper materialOrderDAO;
    
    //@Resource(name="materialOrderDAO")
    //private MaterialOrderDAO materialOrderDAO;
    
    /** ID Generation */
    //@Resource(name="{egovMaterialOrderIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * MATERIAL_ORDER을 등록한다.
	 * @param vo - 등록할 정보가 담긴 MaterialOrderVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertMaterialOrder(MaterialOrderVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	materialOrderDAO.insertMaterialOrder(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }

    /**
	 * MATERIAL_ORDER을 수정한다.
	 * @param vo - 수정할 정보가 담긴 MaterialOrderVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateMaterialOrder(MaterialOrderVO vo) throws Exception {
        materialOrderDAO.updateMaterialOrder(vo);
    }

    /**
	 * MATERIAL_ORDER을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 MaterialOrderVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteMaterialOrder(MaterialOrderVO vo) throws Exception {
        materialOrderDAO.deleteMaterialOrder(vo);
    }

    /**
	 * MATERIAL_ORDER을 조회한다.
	 * @param vo - 조회할 정보가 담긴 MaterialOrderVO
	 * @return 조회한 MATERIAL_ORDER
	 * @exception Exception
	 */
    public MaterialOrderVO selectMaterialOrder(MaterialOrderVO vo) throws Exception {
        MaterialOrderVO resultVO = materialOrderDAO.selectMaterialOrder(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * MATERIAL_ORDER 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return MATERIAL_ORDER 목록
	 * @exception Exception
	 */
    public List<?> selectMaterialOrderList(MaterialOrderDefaultVO searchVO) throws Exception {
        return materialOrderDAO.selectMaterialOrderList(searchVO);
    }

    /**
	 * MATERIAL_ORDER 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return MATERIAL_ORDER 총 갯수
	 * @exception
	 */
    public int selectMaterialOrderListTotCnt(MaterialOrderDefaultVO searchVO) {
		return materialOrderDAO.selectMaterialOrderListTotCnt(searchVO);
	}
    
}
