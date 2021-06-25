package mes.prd.pln.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import mes.prd.pln.service.ProducePlanDDefaultVO;
import mes.prd.pln.service.ProducePlanDService;
import mes.prd.pln.service.ProducePlanDVO;
/**
 * @Class Name : ProducePlanDServiceImpl.java
 * @Description : ProducePlanD Business Implement class
 * @Modification Information
 *
 * @author Jeoung
 * @since 2021-06-25
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("producePlanDService")
public class ProducePlanDServiceImpl extends EgovAbstractServiceImpl implements
        ProducePlanDService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(ProducePlanDServiceImpl.class);

    @Resource(name="producePlanDMapper")
    private ProducePlanDMapper producePlanDDAO;
    
    //@Resource(name="producePlanDDAO")
    //private ProducePlanDDAO producePlanDDAO;
    
    /** ID Generation */
    //@Resource(name="{egovProducePlanDIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * PRODUCE_PLAN_D을 등록한다.
	 * @param vo - 등록할 정보가 담긴 ProducePlanDVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertProducePlanD(ProducePlanDVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	producePlanDDAO.insertProducePlanD(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }

    /**
	 * PRODUCE_PLAN_D을 수정한다.
	 * @param vo - 수정할 정보가 담긴 ProducePlanDVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateProducePlanD(ProducePlanDVO vo) throws Exception {
        producePlanDDAO.updateProducePlanD(vo);
    }

    /**
	 * PRODUCE_PLAN_D을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 ProducePlanDVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteProducePlanD(ProducePlanDVO vo) throws Exception {
        producePlanDDAO.deleteProducePlanD(vo);
    }

    /**
	 * PRODUCE_PLAN_D을 조회한다.
	 * @param vo - 조회할 정보가 담긴 ProducePlanDVO
	 * @return 조회한 PRODUCE_PLAN_D
	 * @exception Exception
	 */
    public ProducePlanDVO selectProducePlanD(ProducePlanDVO vo) throws Exception {
        ProducePlanDVO resultVO = producePlanDDAO.selectProducePlanD(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * PRODUCE_PLAN_D 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return PRODUCE_PLAN_D 목록
	 * @exception Exception
	 */
    public List<?> selectProducePlanDList(ProducePlanDDefaultVO searchVO) throws Exception {
        return producePlanDDAO.selectProducePlanDList(searchVO);
    }

    /**
	 * PRODUCE_PLAN_D 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return PRODUCE_PLAN_D 총 갯수
	 * @exception
	 */
    public int selectProducePlanDListTotCnt(ProducePlanDDefaultVO searchVO) {
		return producePlanDDAO.selectProducePlanDListTotCnt(searchVO);
	}
    
}
