package mes.prd.mov.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.rte.fdl.property.EgovPropertyService;
import mes.prd.mov.service.MonitorService;
import mes.prd.mov.service.MonitorVO;

@Controller
public class MonitorController {
	@Resource(name = "monitorService")
	private MonitorService monitorService;
	
	 /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
    
    @RequestMapping(value="/Monitor.do")
    public String monitor(MonitorVO vo, ModelMap model)
    				throws Exception {
    	return "prd/mon/Monitor.page";
    }
    
    @RequestMapping(value = "/MonitorDisplay.do")
    public String selectMonitorList(MonitorVO vo, ModelMap model) throws Exception{
    	return "/mes/prd/mon/MonitorDisplay";
    }
}
