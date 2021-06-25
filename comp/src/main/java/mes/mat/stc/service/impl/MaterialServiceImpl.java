package mes.mat.stc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import mes.mat.stc.service.MaterialService;
import mes.mat.stc.service.MaterialDefaultVO;
import mes.mat.stc.service.MaterialVO;
import mes.mat.stc.service.impl.MaterialMapper;
/**
 * @Class Name : MaterialServiceImpl.java
 * @Description : Material Business Implement class
 * @Modification Information
 *
 * @author material
 * @since 2021-06-25
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("materialService")
public class MaterialServiceImpl extends EgovAbstractServiceImpl implements
        MaterialService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(MaterialServiceImpl.class);

    @Resource(name="materialMapper")
    private MaterialMapper materialDAO;
    
    //@Resource(name="materialDAO")
    //private MaterialDAO materialDAO;
    
    /** ID Generation */
    //@Resource(name="{egovMaterialIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * material을 등록한다.
	 * @param vo - 등록할 정보가 담긴 MaterialVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertMaterial(MaterialVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	materialDAO.insertMaterial(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }

    /**
	 * material을 수정한다.
	 * @param vo - 수정할 정보가 담긴 MaterialVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateMaterial(MaterialVO vo) throws Exception {
        materialDAO.updateMaterial(vo);
    }

    /**
	 * material을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 MaterialVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteMaterial(MaterialVO vo) throws Exception {
        materialDAO.deleteMaterial(vo);
    }

    /**
	 * material을 조회한다.
	 * @param vo - 조회할 정보가 담긴 MaterialVO
	 * @return 조회한 material
	 * @exception Exception
	 */
    public MaterialVO selectMaterial(MaterialVO vo) throws Exception {
        MaterialVO resultVO = materialDAO.selectMaterial(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * material 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return material 목록
	 * @exception Exception
	 */
    public List<?> selectMaterialList(MaterialDefaultVO searchVO) throws Exception {
        return materialDAO.selectMaterialList(searchVO);
    }

    /**
	 * material 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return material 총 갯수
	 * @exception
	 */
    public int selectMaterialListTotCnt(MaterialDefaultVO searchVO) {
		return materialDAO.selectMaterialListTotCnt(searchVO);
	}
    
}
