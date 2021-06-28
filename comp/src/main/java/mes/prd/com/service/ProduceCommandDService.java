package mes.prd.com.service;

import java.util.List;

/**
 * @Class Name : ProduceCommandDService.java
 * @Description : ProduceCommandD Business class
 * @Modification Information
 *
 * @author soyeon
 * @since 20210625
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface ProduceCommandDService {
	
	/**
	 * PRODUCE_COMMAND_D을 등록한다.
	 * @param vo - 등록할 정보가 담긴 ProduceCommandDVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    String insertProduceCommandD(ProduceCommandDVO vo) throws Exception;
    
    /**
	 * PRODUCE_COMMAND_D을 수정한다.
	 * @param vo - 수정할 정보가 담긴 ProduceCommandDVO
	 * @return void형
	 * @exception Exception
	 */
    void updateProduceCommandD(ProduceCommandDVO vo) throws Exception;
    
    /**
	 * PRODUCE_COMMAND_D을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 ProduceCommandDVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteProduceCommandD(ProduceCommandDVO vo) throws Exception;
    
    /**
	 * PRODUCE_COMMAND_D을 조회한다.
	 * @param vo - 조회할 정보가 담긴 ProduceCommandDVO
	 * @return 조회한 PRODUCE_COMMAND_D
	 * @exception Exception
	 */
    ProduceCommandDVO selectProduceCommandD(ProduceCommandDVO vo) throws Exception;
    
    /**
	 * PRODUCE_COMMAND_D 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return PRODUCE_COMMAND_D 목록
	 * @exception Exception
	 */
    List selectProduceCommandDList(ProduceCommandDVO searchVO) throws Exception;
    
    /**
	 * PRODUCE_COMMAND_D 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return PRODUCE_COMMAND_D 총 갯수
	 * @exception
	 */
    int selectProduceCommandDListTotCnt(ProduceCommandDDefaultVO searchVO);
    
}
