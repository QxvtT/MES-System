package mes.mat.stc.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import mes.mat.stc.service.MaterialOrderDefaultVO;
import mes.mat.stc.service.MaterialOrderService;
import mes.mat.stc.service.MaterialOrderVO;

/**
 * @Class Name : MaterialOrderController.java
 * @Description : MaterialOrder Controller class
 * @Modification Information
 *
 * @author materialOrder
 * @since 2021-06-29
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Controller
@SessionAttributes(types=MaterialOrderVO.class)
public class MaterialOrderController {

    @Resource(name = "materialOrderService")
    private MaterialOrderService materialOrderService;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
    /**
	 * MATERIAL_ORDER 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 MaterialOrderDefaultVO
	 * @return "/materialOrder/MaterialOrderList"
	 * @exception Exception
	 */
    @RequestMapping(value="/materialOrder/MaterialOrderList.do")
    public String selectMaterialOrderList(@ModelAttribute("searchVO") MaterialOrderDefaultVO searchVO, 
    		ModelMap model)
            throws Exception {
    	
    	/** EgovPropertyService.sample */
    	searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
    	searchVO.setPageSize(propertiesService.getInt("pageSize"));
    	
    	/** pageing */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
        List<?> materialOrderList = materialOrderService.selectMaterialOrderList(searchVO);
        model.addAttribute("resultList", materialOrderList);
        
        int totCnt = materialOrderService.selectMaterialOrderListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        
        return "/materialOrder/MaterialOrderList";
    } 
    
    @RequestMapping("/materialOrder/addMaterialOrderView.do")
    public String addMaterialOrderView(
            @ModelAttribute("searchVO") MaterialOrderDefaultVO searchVO, Model model)
            throws Exception {
        model.addAttribute("materialOrderVO", new MaterialOrderVO());
        return "/materialOrder/MaterialOrderRegister";
    }
    
    @RequestMapping("/materialOrder/addMaterialOrder.do")
    public String addMaterialOrder(
            MaterialOrderVO materialOrderVO,
            @ModelAttribute("searchVO") MaterialOrderDefaultVO searchVO, SessionStatus status)
            throws Exception {
        materialOrderService.insertMaterialOrder(materialOrderVO);
        status.setComplete();
        return "forward:/materialOrder/MaterialOrderList.do";
    }
    
    @RequestMapping("/materialOrder/updateMaterialOrderView.do")
    public String updateMaterialOrderView(
            @RequestParam("matOrdNum") java.math.BigDecimal matOrdNum ,
            @RequestParam("matComNum") java.lang.String matComNum ,
            @ModelAttribute("searchVO") MaterialOrderDefaultVO searchVO, Model model)
            throws Exception {
        MaterialOrderVO materialOrderVO = new MaterialOrderVO();
        materialOrderVO.setMatOrdNum(matOrdNum);
        materialOrderVO.setMatComNum(matComNum);
        // 변수명은 CoC 에 따라 materialOrderVO
        model.addAttribute(selectMaterialOrder(materialOrderVO, searchVO));
        return "/materialOrder/MaterialOrderRegister";
    }

    @RequestMapping("/materialOrder/selectMaterialOrder.do")
    public @ModelAttribute("materialOrderVO")
    MaterialOrderVO selectMaterialOrder(
            MaterialOrderVO materialOrderVO,
            @ModelAttribute("searchVO") MaterialOrderDefaultVO searchVO) throws Exception {
        return materialOrderService.selectMaterialOrder(materialOrderVO);
    }

    @RequestMapping("/materialOrder/updateMaterialOrder.do")
    public String updateMaterialOrder(
            MaterialOrderVO materialOrderVO,
            @ModelAttribute("searchVO") MaterialOrderDefaultVO searchVO, SessionStatus status)
            throws Exception {
        materialOrderService.updateMaterialOrder(materialOrderVO);
        status.setComplete();
        return "forward:/materialOrder/MaterialOrderList.do";
    }
    
    @RequestMapping("/materialOrder/deleteMaterialOrder.do")
    public String deleteMaterialOrder(
            MaterialOrderVO materialOrderVO,
            @ModelAttribute("searchVO") MaterialOrderDefaultVO searchVO, SessionStatus status)
            throws Exception {
        materialOrderService.deleteMaterialOrder(materialOrderVO);
        status.setComplete();
        return "forward:/materialOrder/MaterialOrderList.do";
    }

}
