package mes.prd.com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import mes.prd.com.service.ProduceCommandDService;
import mes.prd.com.service.ProduceCommandDDefaultVO;
import mes.prd.com.service.ProduceCommandDVO;
import mes.prd.com.service.impl.ProduceCommandDDAO;
import mes.prd.com.service.impl.ProduceCommandDMapper;
/**
 * @Class Name : ProduceCommandDServiceImpl.java
 * @Description : ProduceCommandD Business Implement class
 * @Modification Information
 *
 * @author soyeon
 * @since 20210625
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("produceCommandDService")
public class ProduceCommandDServiceImpl extends EgovAbstractServiceImpl implements
        ProduceCommandDService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(ProduceCommandDServiceImpl.class);

    @Resource(name="produceCommandDMapper")
    private ProduceCommandDMapper produceCommandDDAO;
    
    //@Resource(name="produceCommandDDAO")
    //private ProduceCommandDDAO produceCommandDDAO;
    
    /** ID Generation */
    //@Resource(name="{egovProduceCommandDIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * PRODUCE_COMMAND_D을 등록한다.
	 * @param vo - 등록할 정보가 담긴 ProduceCommandDVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertProduceCommandD(ProduceCommandDVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	produceCommandDDAO.insertProduceCommandD(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }

    /**
	 * PRODUCE_COMMAND_D을 수정한다.
	 * @param vo - 수정할 정보가 담긴 ProduceCommandDVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateProduceCommandD(ProduceCommandDVO vo) throws Exception {
        produceCommandDDAO.updateProduceCommandD(vo);
    }

    /**
	 * PRODUCE_COMMAND_D을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 ProduceCommandDVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteProduceCommandD(ProduceCommandDVO vo) throws Exception {
        produceCommandDDAO.deleteProduceCommandD(vo);
    }

    /**
	 * PRODUCE_COMMAND_D을 조회한다.
	 * @param vo - 조회할 정보가 담긴 ProduceCommandDVO
	 * @return 조회한 PRODUCE_COMMAND_D
	 * @exception Exception
	 */
    public ProduceCommandDVO selectProduceCommandD(ProduceCommandDVO vo) throws Exception {
        ProduceCommandDVO resultVO = produceCommandDDAO.selectProduceCommandD(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * PRODUCE_COMMAND_D 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return PRODUCE_COMMAND_D 목록
	 * @exception Exception
	 */
    public List<?> selectProduceCommandDList(ProduceCommandDDefaultVO searchVO) throws Exception {
        return produceCommandDDAO.selectProduceCommandDList(searchVO);
    }

    /**
	 * PRODUCE_COMMAND_D 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return PRODUCE_COMMAND_D 총 갯수
	 * @exception
	 */
    public int selectProduceCommandDListTotCnt(ProduceCommandDDefaultVO searchVO) {
		return produceCommandDDAO.selectProduceCommandDListTotCnt(searchVO);
	}
    
}
