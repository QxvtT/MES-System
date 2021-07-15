package mes.prd.mon.service;

import java.util.List;

public interface MonitorService {
	List<?> selectMonitorList(MonitorVO vo) throws Exception;
}
