package mes.prd.pln.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import mes.prd.pln.service.GridData;
import mes.prd.pln.service.ProducePlanDDefaultVO;
import mes.prd.pln.service.ProducePlanDService;
import mes.prd.pln.service.ProducePlanDVO;
import mes.sal.out.service.ItemHistoryVO;
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
    public void insertProducePlanD(ProducePlanDVO vo) throws Exception {
        producePlanDDAO.insertProducePlanD(vo);
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

    // 생산계획 목록 조회
	public List<?> selectProducePlanList(ProducePlanDVO prdVO) throws Exception {
		return producePlanDDAO.selectProducePlanList(prdVO);
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
    
    // 제품테이블 조회
	public List<?> selectItemList(ProducePlanDVO itmVO) throws Exception {
		return producePlanDDAO.selectItemList(itmVO);
	}

	public ProducePlanDVO selectItem(ProducePlanDVO itmVO) throws Exception {
		ProducePlanDVO resultVO = producePlanDDAO.selectItem(itmVO);
		if(resultVO == null)
			throw processException("info.nodata.msg");
		return resultVO;
	}

	// cud 통합
	public void producePlanUpdate(GridData gridData) throws Exception {
        if(gridData.getUpdatedRows() != null) {
        	for(int i =0; i<gridData.getUpdatedRows().size(); i++) {
        		producePlanDDAO.updateProducePlanD(gridData.getUpdatedRows().get(i));
        	}
        }
        if(gridData.getCreatedRows() != null) {
        	for(int i =0; i<gridData.getCreatedRows().size(); i++) {
        		ProducePlanDVO vo= gridData.getCreatedRows().get(i);
        		vo.setPrdDate(gridData.getProducePlanDVO().getPrdDate());
        		vo.setPrdName(gridData.getProducePlanDVO().getPrdName());
        		vo.setPrdNote(gridData.getProducePlanDVO().getPrdNote());      		
        		producePlanDDAO.insertProducePlanD(vo);
        	}
        }
        if(gridData.getDeletedRows() != null) {
        	for(int i =0; i<gridData.getDeletedRows().size(); i++) {
        		producePlanDDAO.deleteProducePlanD(gridData.getDeletedRows().get(i));
        	}
        }
    }

	
    
}
