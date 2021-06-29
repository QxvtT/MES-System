package mes.common.modal.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import egovframework.rte.fdl.property.EgovPropertyService;
import mes.common.modal.service.OperationService;
import mes.common.modal.service.OperationVO;

/**
 * @Class Name : OperationController.java
 * @Description : Operation Controller class
 * @Modification Information
 *
 * @author sunghwan
 * @since 2021-06-29
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Controller
//@SessionAttributes(types=OperationVO.class)
public class OperationController {

    @Resource(name = "operationService")
    private OperationService operationService;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
    /**
	 * OPERATION 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 OperationDefaultVO
	 * @return "/operation/OperationList"
	 * @exception Exception
	 */
    @RequestMapping(value="/common/modal/OperationList")
    @ResponseBody
    public List<?> ajaxSelectOperationList(OperationVO searchVO, 
    		ModelMap model)
            throws Exception {
    	
        List<?> operationList = operationService.selectOperationList(searchVO);
        model.addAttribute("resultList", operationList);
        
        return operationList;
    } 
    
    @RequestMapping(value="/common/modal/OperationList.do")
    public String selectOperationList( OperationVO searchVO, 
    		ModelMap model)
            throws Exception {
    	
        return "/common/modal/OperationList";
    } 
    /**
     * @RequestMapping(value="/common/modal/OperationList")
    @ResponseBody
    public List<?> ajaxSelectOperationList(OperationVO searchVO, 
    		ModelMap model)
            throws Exception {
    	
        List<?> operationList = operationService.selectOperationList(searchVO);
        model.addAttribute("resultList", operationList);
        
        return operationList;
    } 
    
    @RequestMapping(value="/common/modal/OperationList.do")
    public String selectOperationList( OperationVO searchVO, 
    		ModelMap model)
            throws Exception {
    	
        return "/common/modal/OperationList";
    } 
    
    
    
    @RequestMapping(value="/common/modal/OperationList")
    @ResponseBody
    public List<?> ajaxSelectOperationList(OperationVO searchVO, 
    		ModelMap model)
            throws Exception {
    	
        List<?> operationList = operationService.selectOperationList(searchVO);
        model.addAttribute("resultList", operationList);
        
        return operationList;
    } 
    
    @RequestMapping(value="/common/modal/OperationList.do")
    public String selectOperationList( OperationVO searchVO, 
    		ModelMap model)
            throws Exception {
    	
        return "/common/modal/OperationList";
    } 
    
    
    
    @RequestMapping(value="/common/modal/OperationList")
    @ResponseBody
    public List<?> ajaxSelectOperationList(OperationVO searchVO, 
    		ModelMap model)
            throws Exception {
    	
        List<?> operationList = operationService.selectOperationList(searchVO);
        model.addAttribute("resultList", operationList);
        
        return operationList;
    } 
    
    @RequestMapping(value="/common/modal/OperationList.do")
    public String selectOperationList( OperationVO searchVO, 
    		ModelMap model)
            throws Exception {
    	
        return "/common/modal/OperationList";
    } 
    
    @RequestMapping(value="/common/modal/OperationList")
    @ResponseBody
    public List<?> ajaxSelectOperationList(OperationVO searchVO, 
    		ModelMap model)
            throws Exception {
    	
        List<?> operationList = operationService.selectOperationList(searchVO);
        model.addAttribute("resultList", operationList);
        
        return operationList;
    } 
    
    @RequestMapping(value="/common/modal/OperationList.do")
    public String selectOperationList( OperationVO searchVO, 
    		ModelMap model)
            throws Exception {
    	
        return "/common/modal/OperationList";
    } 
     * 
     * 
     * 
     * **/
    
}
