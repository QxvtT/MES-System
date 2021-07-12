package mes.prd.mov.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import mes.prd.mov.service.MonitorService;
import mes.prd.mov.service.MonitorVO;

@Service("monitorService")
public class MonitorServiceImpl extends EgovAbstractServiceImpl implements MonitorService{
	private static final Logger LOGGER = LoggerFactory.getLogger(MonitorServiceImpl.class);
	
	@Resource(name = "monitorMapper")
	private MonitorMapper monitorDAO;
	
	public List<?> selectMonitorList(MonitorVO vo) throws Exception {
		return monitorDAO.selectMonitor(vo);
	}
}
