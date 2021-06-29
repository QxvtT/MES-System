package mes.common.modal.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import mes.common.modal.service.OperationDefaultVO;
import mes.common.modal.service.OperationService;
import mes.common.modal.service.OperationVO;
/**
 * @Class Name : OperationServiceImpl.java
 * @Description : Operation Business Implement class
 * @Modification Information
 *
 * @author sunghwan
 * @since 2021-06-29
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("operationService")
public class OperationServiceImpl extends EgovAbstractServiceImpl implements
        OperationService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(OperationServiceImpl.class);

    @Resource(name="operationMapper")
    private OperationMapper operationDAO;
    
    //@Resource(name="operationDAO")
    //private OperationDAO operationDAO;
    
    /** ID Generation */
    //@Resource(name="{egovOperationIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * OPERATION을 등록한다.
	 * @param vo - 등록할 정보가 담긴 OperationVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertOperation(OperationVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	operationDAO.insertOperation(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }

    /**
	 * OPERATION을 수정한다.
	 * @param vo - 수정할 정보가 담긴 OperationVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateOperation(OperationVO vo) throws Exception {
        operationDAO.updateOperation(vo);
    }

    /**
	 * OPERATION을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 OperationVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteOperation(OperationVO vo) throws Exception {
        operationDAO.deleteOperation(vo);
    }

    /**
	 * OPERATION을 조회한다.
	 * @param vo - 조회할 정보가 담긴 OperationVO
	 * @return 조회한 OPERATION
	 * @exception Exception
	 */
    public OperationVO selectOperation(OperationVO vo) throws Exception {
        OperationVO resultVO = operationDAO.selectOperation(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * OPERATION 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return OPERATION 목록
	 * @exception Exception
	 */
    public List<?> selectOperationList(OperationVO searchVO) throws Exception {
        return operationDAO.selectOperationList(searchVO);
    }

    /**
	 * OPERATION 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return OPERATION 총 갯수
	 * @exception
	 */
    public int selectOperationListTotCnt(OperationVO searchVO) {
		return operationDAO.selectOperationListTotCnt(searchVO);
	}
    
}
