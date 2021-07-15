package mes.prd.mon.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import mes.prd.mon.service.MonitorVO;

@Mapper("monitorMapper")
public interface MonitorMapper {
	public List<?> selectMonitor(MonitorVO vo) throws Exception;
}
