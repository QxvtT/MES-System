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
import mes.common.modal.service.ItemVO;
import mes.common.modal.service.MachineVO;
import mes.common.modal.service.MaterialVO;
import mes.common.modal.service.OperationService;
import mes.common.modal.service.OperationVO;
import mes.common.modal.service.ProcessVO;

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
    @RequestMapping(value="/OperationList")
    @ResponseBody
    public List<?> ajaxSelectOperationList(OperationVO searchVO, 
    		ModelMap model)
            throws Exception {
    	
        List<?> operationList = operationService.selectOperationList(searchVO);
        model.addAttribute("resultList", operationList);
        
        return operationList;
    } 
    
    @RequestMapping(value="/OperationList.page")
    public String operationList( OperationVO searchVO, 
    		ModelMap model)
            throws Exception {
    	
        return "OperationList.part";
    } 
    
    // 
    @RequestMapping(value="/ItemList")
    @ResponseBody
    public List<?> ajaxSelectItemList(ItemVO searchVO, ModelMap model) throws Exception {
    	
        List<?> itemList = operationService.selectItemList(searchVO);
        model.addAttribute("resultList", itemList);
        
        return itemList;
    } 
    
    @RequestMapping(value="/ItemList.page")
    public String selectItemList( ItemVO searchVO, 
    		ModelMap model)
            throws Exception {
    	
        return "ItemList.part";
    } 
    
    
    
    @RequestMapping(value="/ProcessList")
    @ResponseBody
    public List<?> ajaxselectProcessList(ProcessVO searchVO, 
    		ModelMap model)
            throws Exception {
    	
        List<?> ProcessList = operationService.selectProcessList(searchVO);
        model.addAttribute("resultList", ProcessList);
        
        return ProcessList;
    } 
    
    @RequestMapping(value="/ProcessList.page")
    public String selectProcessList( ProcessVO searchVO, 
    		ModelMap model)
            throws Exception {
    	
        return "ProcessList.part";
    } 
    
    
    
    @RequestMapping(value="/MaterialList")
    @ResponseBody
    public List<?> ajaxselectMaterialList(MaterialVO searchVO, 
    		ModelMap model)
            throws Exception {
    	
        List<?> MaterialList = operationService.selectMaterialList(searchVO);
        model.addAttribute("resultList", MaterialList);
        
        return MaterialList;
    } 
    
    @RequestMapping(value="/MaterialList.page")
    public String selectMaterialList( MaterialVO searchVO, 
    		ModelMap model)
            throws Exception {
    	
        return "MaterialList.part";
    } 
    
    
    @RequestMapping(value="/MachineList")
    @ResponseBody
    public List<?> ajaxSelectMachineList(MachineVO searchVO, 
    		ModelMap model)
            throws Exception {
    	
        List<?> MachineList = operationService.selectMachineList(searchVO);
        model.addAttribute("resultList", MachineList);
        
        return MachineList;
    } 
    
    @RequestMapping(value="/MachineList.page")
    public String selectOperationList( OperationVO searchVO, 
    		ModelMap model)
            throws Exception {
    	
        return "MachineList";
    } 
    
    
}
