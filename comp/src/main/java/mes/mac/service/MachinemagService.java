package mes.mac.service;

import java.util.List;

/**
 * @Class Name : MachineService.java
 * @Description : Machine Business class
 * @Modification Information
 *
 * @author sunghwan
 * @since 2021-07-02
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

//service 상속받는 serviceimpl 들은 모두 이 method를 갖고 있어야 한다.

public interface MachinemagService {
	
	/**
	 * MACHINE을 등록한다.
	 * @param vo - 등록할 정보가 담긴 MachineVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    String insertMachine(MachinemagVO vo) throws Exception;
    
    /**
	 * MACHINE을 수정한다.
	 * @param vo - 수정할 정보가 담긴 MachineVO
	 * @return void형
	 * @exception Exception
	 */
    void updatemachine(MachinemagVO vo) throws Exception;
    
    /**
	 * MACHINE을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 MachineVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteMachine(MachinemagVO vo) throws Exception;
    
    /**
	 * MACHINE을 조회한다.
	 * @param vo - 조회할 정보가 담긴 MachineVO
	 * @return 조회한 MACHINE
	 * @exception Exception
	 */
    MachinemagVO selectMachine(MachinemagVO vo) throws Exception;
    
    /**
	 * MACHINE 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return MACHINE 목록
	 * @exception Exception
	 */
    List selectMachineList(MachinemagVO searchVO) throws Exception;
    
    /**
	 * MACHINE 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return MACHINE 총 갯수
	 * @exception
	 */
   
    
}
