package mes.mat.stc.web;

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

import mes.mat.stc.service.MaterialStockService;
import mes.mat.stc.service.MaterialDefaultVO;
import mes.mat.stc.service.MaterialService;
import mes.mat.stc.service.MaterialStockDefaultVO;
import mes.mat.stc.service.MaterialStockVO;

/**
 * @Class Name : MaterialStockController.java
 * @Description : MaterialStock Controller class
 * @Modification Information
 *
 * @author materialStock
 * @since 2021-06-25
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Controller
@SessionAttributes(types=MaterialStockVO.class)
public class MaterialStockController {

    @Resource(name = "materialStockService")
    private MaterialStockService materialStockService;
    @Resource(name = "materialService")
    private MaterialService materialService;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
    /**
	 * MATERIAL_STOCK 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 MaterialStockDefaultVO
	 * @return "/materialStock/MaterialStockList"
	 * @exception Exception
	 */
    
    @RequestMapping(value="/mat/stc/MaterialStockList", method=RequestMethod.GET)
    @ResponseBody
    public List<?> ajax(MaterialStockVO searchVO) throws Exception {
    	
    	List<?> list = materialStockService.selectMaterialStockList(searchVO);
    	
    	System.out.println("a");
    	System.out.println(list);
    	return list;
    }
    
    @RequestMapping("/mat/stc/MaterialStockList.do")
    public String selectMaterialStockList(@ModelAttribute("searchVO") MaterialStockDefaultVO searchVO, ModelMap model) throws Exception{
    	return "mat/stc/MaterialStockList.page";
    }
    
    @RequestMapping(value="/mat/stc/MaterialLotStockList", method=RequestMethod.GET)
    @ResponseBody
    public List<?> ajax2(MaterialStockVO searchVO) throws Exception {
    	
    	List<?> list = materialStockService.selectMaterialStockList(searchVO);
    	
    	System.out.println("a");
    	System.out.println(list);
    	return list;
    }
    
    @RequestMapping("/mat/stc/MaterialLotStockList.do")
    public String selectMaterialLotStockList(@ModelAttribute("searchVO") MaterialStockDefaultVO searchVO, ModelMap model) throws Exception{
    	return "mat/stc/MaterialLotStockList.page";
    }
    /*
    @RequestMapping(value="/mat/stc/MaterialStockList.do")
    public String selectMaterialStockList(@ModelAttribute("searchVO") MaterialStockDefaultVO searchVO, MaterialDefaultVO materialVO,
    		ModelMap model)
            throws Exception {
    	
    	searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
    	searchVO.setPageSize(propertiesService.getInt("pageSize"));
    	
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
        List<?> materialStockList = materialStockService.selectMaterialStockList(searchVO);
        model.addAttribute("resultList", materialStockList);
        model.addAttribute("materials", materialService.selectMaterialList(materialVO));
        
        int totCnt = materialStockService.selectMaterialStockListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        
        return "mat/stc/MaterialStockList.page";
    } */
    
    @RequestMapping("/mat/stc/addMaterialStockView.do")
    public String addMaterialStockView(
            @ModelAttribute("searchVO") MaterialStockDefaultVO searchVO, Model model)
            throws Exception {
        model.addAttribute("materialStockVO", new MaterialStockVO());
        return "mat/stc/MaterialStockRegister.page";
    }
    
    @RequestMapping("/mat/stc/addMaterialStock.do")
    public String addMaterialStock(
            MaterialStockVO materialStockVO,
            @ModelAttribute("searchVO") MaterialStockDefaultVO searchVO, SessionStatus status)
            throws Exception {
        materialStockService.insertMaterialStock(materialStockVO);
        status.setComplete();
        return "forward:/mat/stc/MaterialStockList.do";
    }
    
    @RequestMapping("/mat/stc/updateMaterialStockView.do")
    public String updateMaterialStockView(
            @RequestParam("lotNum") java.math.BigDecimal lotNum ,
            @RequestParam("matCode") java.lang.String matCode ,
            @ModelAttribute("searchVO") MaterialStockDefaultVO searchVO, Model model)
            throws Exception {
        MaterialStockVO materialStockVO = new MaterialStockVO();
        materialStockVO.setLotNum(lotNum);
        materialStockVO.setMatCode(matCode);
        // 변수명은 CoC 에 따라 materialStockVO
        model.addAttribute(selectMaterialStock(materialStockVO, searchVO));
        return "mat/stc/MaterialStockRegister.page";
    }

    @RequestMapping("/mat/stc/selectMaterialStock.do")
    public @ModelAttribute("materialStockVO")
    MaterialStockVO selectMaterialStock(
            MaterialStockVO materialStockVO,
            @ModelAttribute("searchVO") MaterialStockDefaultVO searchVO) throws Exception {
        return materialStockService.selectMaterialStock(materialStockVO);
    }

    @RequestMapping("/mat/stc/updateMaterialStock.do")
    public String updateMaterialStock(
            MaterialStockVO materialStockVO,
            @ModelAttribute("searchVO") MaterialStockDefaultVO searchVO, SessionStatus status)
            throws Exception {
        materialStockService.updateMaterialStock(materialStockVO);
        status.setComplete();
        return "forward:/mat/stc/MaterialStockList.do";
    }
    
    @RequestMapping("/mat/stc/deleteMaterialStock.do")
    public String deleteMaterialStock(
            MaterialStockVO materialStockVO,
            @ModelAttribute("searchVO") MaterialStockDefaultVO searchVO, SessionStatus status)
            throws Exception {
        materialStockService.deleteMaterialStock(materialStockVO);
        status.setComplete();
        return "forward:/mat/stc/MaterialStockList.do";
    }

}
