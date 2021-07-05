package mes.mac.mng.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import mes.mac.mng.service.MachinemagDefaultVO;
import mes.mac.mng.service.MachinemagService;
import mes.mac.mng.service.MachinemagVO;
/**
 * @Class Name : MachineServiceImpl.java
 * @Description : Machine Business Implement class
 * @Modification Information
 *
 * @author sunghwan
 * @since 2021-07-02
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("machineService")
public class MachinemagServiceImpl extends EgovAbstractServiceImpl implements
        MachinemagService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(MachinemagServiceImpl.class);

    @Resource(name="machineMapper")
    private MachinemagMapper machineDAO;
    
    //@Resource(name="machineDAO")
    //private MachineDAO machineDAO;
    
    /** ID Generation */
    //@Resource(name="{egovMachineIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * MACHINE을 등록한다.
	 * @param vo - 등록할 정보가 담긴 MachineVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertMachine(MachinemagVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	machineDAO.insertMachine(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }

    /**
	 * MACHINE을 수정한다.
	 * @param vo - 수정할 정보가 담긴 MachineVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateMachine(MachinemagVO vo) throws Exception {
        machineDAO.updateMachine(vo);
    }

    /**
	 * MACHINE을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 MachineVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteMachine(MachinemagVO vo) throws Exception {
        machineDAO.deleteMachine(vo);
    }

    /**
	 * MACHINE을 조회한다.
	 * @param vo - 조회할 정보가 담긴 MachineVO
	 * @return 조회한 MACHINE
	 * @exception Exception
	 */
    public MachinemagVO selectMachine(MachinemagVO vo) throws Exception {
        MachinemagVO resultVO = machineDAO.selectMachine(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * MACHINE 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return MACHINE 목록
	 * @exception Exception
	 */
    public List<?> selectMachineList(MachinemagDefaultVO searchVO) throws Exception {
        return machineDAO.selectMachineList(searchVO);
    }

    /**
	 * MACHINE 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return MACHINE 총 갯수
	 * @exception
	 */
    public int selectMachineListTotCnt(MachinemagDefaultVO searchVO) {
		return machineDAO.selectMachineListTotCnt(searchVO);
	}
    
}
