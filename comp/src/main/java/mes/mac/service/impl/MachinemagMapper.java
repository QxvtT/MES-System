package mes.mac.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import mes.mac.service.MachinemagDefaultVO;
import mes.mac.service.MachinemagVO;

/**
 * @Class Name : MachineMapper.java
 * @Description : Machine Mapper Class
 * @Modification Information
 *
 * @author sunghwan
 * @since 2021-07-02
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Mapper("machineMapper")
public interface MachinemagMapper {

	/**
	 * MACHINE을 등록한다.
	 * @param vo - 등록할 정보가 담긴 MachineVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public void insertMachine(MachinemagVO vo) throws Exception;

    /**
	 * MACHINE을 수정한다.
	 * @param vo - 수정할 정보가 담긴 MachineVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateMachine(MachinemagVO vo) throws Exception;

    /**
	 * MACHINE을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 MachineVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteMachine(MachinemagVO vo) throws Exception;

    /**
	 * MACHINE을 조회한다.
	 * @param vo - 조회할 정보가 담긴 MachineVO
	 * @return 조회한 MACHINE
	 * @exception Exception
	 */
    public MachinemagVO selectMachine(MachinemagVO vo) throws Exception;

    /**
	 * MACHINE 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return MACHINE 목록
	 * @exception Exception
	 */
    public List<?> selectMachineList(MachinemagDefaultVO searchVO) throws Exception;

    /**
	 * MACHINE 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return MACHINE 총 갯수
	 * @exception
	 */
    public int selectMachineListTotCnt(MachinemagDefaultVO searchVO);

}
