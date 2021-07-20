package mes.prd.res.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import mes.prd.res.service.ProcessResultService;
import mes.prd.res.service.GridDataVO;
import mes.prd.res.service.ProcessResultDefaultVO;
import mes.prd.res.service.ProcessResultVO;

/**
 * @Class Name : ProcessResultController.java
 * @Description : ProcessResult Controller class
 * @Modification Information
 *
 * @author seongwon
 * @since 20210706
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Controller
@SessionAttributes(types=ProcessResultVO.class)
public class ProcessResultController {

    @Resource(name = "processResultService")
    private ProcessResultService processResultService;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
    /**
	 * PROCESS_RESULT 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 ProcessResultDefaultVO
	 * @return "ProcessResultList"
	 * @exception Exception
	 */
    
    @RequestMapping(value="/prd/res/ProcessResultList", method = RequestMethod.GET)
    @ResponseBody
    public List<?> selectProcessResultList(ProcessResultVO processResultVO)
            throws Exception {
        List<?> processResultList = processResultService.selectProcessResultList(processResultVO);
        return processResultList;
    }
    
    @RequestMapping(value="/prd/res/ProcessResultSelect", method = RequestMethod.GET)
    @ResponseBody
    public List<?> processResultSelect(ProcessResultVO processResultVO)
            throws Exception {
        List<?> processResultSelect = processResultService.processResultSelect(processResultVO);
        return processResultSelect;
    }
    
    @RequestMapping(value="/prd/res/ProduceSelect", method = RequestMethod.GET)
    @ResponseBody
    public List<?> produceSelect(ProcessResultVO processResultVO)
            throws Exception {
        List<?> produceSelect = processResultService.produceSelect(processResultVO);
        return produceSelect;
    }
    @RequestMapping(value="/prd/res/SetProduceSelect", method = RequestMethod.GET)
    @ResponseBody
    public List<?> setProduceSelect(ProcessResultVO processResultVO)
            throws Exception {
        List<?> setProduceSelect = processResultService.setProduceSelect(processResultVO);
        return setProduceSelect;
    }
    @RequestMapping(value="/prd/res/ProcessSelectMovNum", method = RequestMethod.GET)
    @ResponseBody
    public List<?> v(ProcessResultVO processResultVO)
            throws Exception {
        List<?> processSelectMovNum = processResultService.processSelectMovNum (processResultVO);
        return processSelectMovNum ;
    }
    
    
    
    @RequestMapping(value="/prd/res/updatePrcEnd")
    @ResponseBody
  public void updatePrcEnd(@RequestBody ProcessResultVO processResultVO) throws Exception {
    	processResultService.updatePrcEnd(processResultVO);
  } 
    @RequestMapping(value="/prd/res/updatePrcStr")
    @ResponseBody
  public void updatePrcStr(@RequestBody ProcessResultVO processResultVO) throws Exception {
    	processResultService.updatePrcStr(processResultVO);
  }
    
    @RequestMapping(value="/prd/res/dataReset")
    @ResponseBody
  public void dataReset(@RequestBody ProcessResultVO processResultVO) throws Exception {
    	processResultService.dataReset(processResultVO);
  } 
    
    
    
    @RequestMapping(value="/prd/res/resultSuccess")
    @ResponseBody
  public void ItemHistoryUpdate(@RequestBody GridDataVO gridData) throws Exception {
    	
    	processResultService.resultSuccess(gridData);
  }
    
    @RequestMapping(value="/prd/res/ProcessListR", method = RequestMethod.GET)
    @ResponseBody
    public List<?> ProcessListR(ProcessResultVO processResultVO)
            throws Exception {
        List<?> processListR = processResultService.ProcessListR(processResultVO);
        return processListR;
    }
    
    
    
    
    
    
    @RequestMapping(value="/prd/res/ProcessResultList.do")
    public String selectProcessResultList() throws Exception {

        return "prd/res/ProcessResultList.page";
    }
    @RequestMapping(value="/prd/res/ProcessListR.do")
    public String ProcessListR() throws Exception {

        return "prd/res/ProcessListR.page";
    } 
   
    
    @RequestMapping("/prd/res/addProcessResultView.do")
    public String addProcessResultView(
            @ModelAttribute("searchVO") ProcessResultDefaultVO searchVO, Model model)
            throws Exception {
        model.addAttribute("processResultVO", new ProcessResultVO());
        return "/prd/resProcessResultRegister.page";
    }
    
    @RequestMapping("/prd/res/addProcessResult.do")
    public String addProcessResult(
            ProcessResultVO processResultVO,
            @ModelAttribute("searchVO") ProcessResultDefaultVO searchVO, SessionStatus status)
            throws Exception {
        processResultService.insertProcessResult(processResultVO);
        status.setComplete();
        return "forward:ProcessResultList.do";
    }
    
    @RequestMapping("/prd/res/updateProcessResultView.do")
    public String updateProcessResultView(
            @RequestParam("movNum") java.lang.String movNum ,
            @ModelAttribute("searchVO") ProcessResultDefaultVO searchVO, Model model)
            throws Exception {
        ProcessResultVO processResultVO = new ProcessResultVO();
        processResultVO.setMovNum(movNum);
        // 변수명은 CoC 에 따라 processResultVO
        model.addAttribute(selectProcessResult(processResultVO, searchVO));
        return "/prd/res/ProcessResultRegister.page";
    }

    @RequestMapping("/prd/res/selectProcessResult.do")
    public @ModelAttribute("processResultVO")
    ProcessResultVO selectProcessResult(
            ProcessResultVO processResultVO,
            @ModelAttribute("searchVO") ProcessResultDefaultVO searchVO) throws Exception {
        return processResultService.selectProcessResult(processResultVO);
    }

    @RequestMapping("/prd/res/updateProcessResult.do")
    public String updateProcessResult(
            ProcessResultVO processResultVO,
            @ModelAttribute("searchVO") ProcessResultDefaultVO searchVO, SessionStatus status)
            throws Exception {
        processResultService.updateProcessResult(processResultVO);
        status.setComplete();
        return "forward:/prd/res/ProcessResultList.do";
    }
    
    @RequestMapping("/prd/res/deleteProcessResult.do")
    public String deleteProcessResult(
            ProcessResultVO processResultVO,
            @ModelAttribute("searchVO") ProcessResultDefaultVO searchVO, SessionStatus status)
            throws Exception {
        processResultService.deleteProcessResult(processResultVO);
        status.setComplete();
        return "forward:/prd/res/ProcessResultList.do";
    }

}
