package mes.prd.mov.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import mes.prd.mov.service.MonitorVO;

@Mapper("monitorMapper")
public interface MonitorMapper {
	public List<?> selectMonitor(MonitorVO vo) throws Exception;
}
