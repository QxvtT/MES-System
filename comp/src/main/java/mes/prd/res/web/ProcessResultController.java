package mes.prd.res.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import mes.prd.res.service.ProcessResultService;
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
    
    @RequestMapping(value="ProcessResultList", method = RequestMethod.GET)
    @ResponseBody
    public List<?> selectProcessResultList(ProcessResultVO processResultVO)
            throws Exception {
        List<?> processResultList = processResultService.selectProcessResultList(processResultVO);
        return processResultList;
    }
    
    @RequestMapping(value="ProcessResultSelect", method = RequestMethod.GET)
    @ResponseBody
    public List<?> processResultSelect(ProcessResultVO processResultVO)
            throws Exception {
        List<?> processResultSelect = processResultService.processResultSelect(processResultVO);
        return processResultSelect;
    }
    
    @RequestMapping(value="ProduceSelect", method = RequestMethod.GET)
    @ResponseBody
    public List<?> produceSelect(ProcessResultVO processResultVO)
            throws Exception {
        List<?> produceSelect = processResultService.produceSelect(processResultVO);
        return produceSelect;
    }
    
    
    @RequestMapping(value="ProcessResultList.do")
    public String selectProcessResultList() throws Exception {

        return "prd/res/ProcessResultList.page";
    } 
    
    @RequestMapping("addProcessResultView.do")
    public String addProcessResultView(
            @ModelAttribute("searchVO") ProcessResultDefaultVO searchVO, Model model)
            throws Exception {
        model.addAttribute("processResultVO", new ProcessResultVO());
        return "/prd/resProcessResultRegister.page";
    }
    
    @RequestMapping("addProcessResult.do")
    public String addProcessResult(
            ProcessResultVO processResultVO,
            @ModelAttribute("searchVO") ProcessResultDefaultVO searchVO, SessionStatus status)
            throws Exception {
        processResultService.insertProcessResult(processResultVO);
        status.setComplete();
        return "forward:ProcessResultList.do";
    }
    
    @RequestMapping("updateProcessResultView.do")
    public String updateProcessResultView(
            @RequestParam("movNum") java.lang.String movNum ,
            @ModelAttribute("searchVO") ProcessResultDefaultVO searchVO, Model model)
            throws Exception {
        ProcessResultVO processResultVO = new ProcessResultVO();
        processResultVO.setMovNum(movNum);
        // 변수명은 CoC 에 따라 processResultVO
        model.addAttribute(selectProcessResult(processResultVO, searchVO));
        return "prd/resProcessResultRegister.page";
    }

    @RequestMapping("selectProcessResult.do")
    public @ModelAttribute("processResultVO")
    ProcessResultVO selectProcessResult(
            ProcessResultVO processResultVO,
            @ModelAttribute("searchVO") ProcessResultDefaultVO searchVO) throws Exception {
        return processResultService.selectProcessResult(processResultVO);
    }

    @RequestMapping("updateProcessResult.do")
    public String updateProcessResult(
            ProcessResultVO processResultVO,
            @ModelAttribute("searchVO") ProcessResultDefaultVO searchVO, SessionStatus status)
            throws Exception {
        processResultService.updateProcessResult(processResultVO);
        status.setComplete();
        return "forward:ProcessResultList.do";
    }
    
    @RequestMapping("deleteProcessResult.do")
    public String deleteProcessResult(
            ProcessResultVO processResultVO,
            @ModelAttribute("searchVO") ProcessResultDefaultVO searchVO, SessionStatus status)
            throws Exception {
        processResultService.deleteProcessResult(processResultVO);
        status.setComplete();
        return "forward:ProcessResultList.do";
    }

}
