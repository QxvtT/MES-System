package mes.sal.out.web;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import egovframework.rte.fdl.property.EgovPropertyService;
import lombok.Data;
import mes.sal.ord.service.OrderMVO;
import mes.sal.out.service.ItmOutGridDataVO;
import mes.sal.out.service.ItemHistoryDefaultVO;
import mes.sal.out.service.ItemHistoryService;
import mes.sal.out.service.ItemHistoryVO;

/**
 * @Class Name : ItemHistoryController.java
 * @Description : ItemHistory Controller class
 * @Modification Information
 *
 * @author seongwon
 * @since 2021-06-29
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */


@Controller
@SessionAttributes(types=ItemHistoryVO.class)
public class ItemHistoryController {

    @Resource(name = "itemHistoryService")
    private ItemHistoryService itemHistoryService;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
    /**
	 * ITEM_HISTORY 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 ItemHistoryDefaultVO
	 * @return "/itemHistory/ItemHistoryList"
	 * @exception Exception
	 */
    
    
    
    
    @RequestMapping(value="/sal/out/ItemHistoryList", method=RequestMethod.GET)
    @ResponseBody
    public List<?> ajax(ItemHistoryVO searchVO ) throws Exception {
    	if(searchVO.getOperCode() != null && searchVO.getOperCode() != "") {
    		String[] operCodeList = searchVO.getOperCode().split(",");
    		for(int i =0; i<operCodeList.length; i++) {
    			operCodeList[i] = operCodeList[i].trim();
    		}
    		List<String> operCodes = new ArrayList<String>();
    		operCodes = Arrays.asList(operCodeList);
    		searchVO.setOperCodes(operCodes);
    	}
        List<?> ItemHistoryList = itemHistoryService.selectItemHistoryList(searchVO);
        return ItemHistoryList;
    }
    @RequestMapping(value="/sal/out/ItemHistoryList.do")
    public String selectItemHistoryList(@ModelAttribute("searchVO") ItemHistoryDefaultVO searchVO, 
    		ModelMap model)
            throws Exception {

        return "sal/out/ItemHistoryList.page";
    }
    
    @RequestMapping(value="/sal/out/ItemHisNumList", method=RequestMethod.GET)
    @ResponseBody
    public List<?> ItemHisNumList(ItemHistoryVO searchVO ) throws Exception {
    	
        List<?> ItemHisNumList = itemHistoryService.itemHisNumList(searchVO);
        return ItemHisNumList;
    }
    @RequestMapping(value="/sal/out/ItemHistoryRegist")
    @ResponseBody
    public List<?> ItemHistoryRegist(ItemHistoryVO searchVO ) throws Exception {
    	
        List<?> ItemHistoryRegist = itemHistoryService.itemHistoryRegist(searchVO);
        return ItemHistoryRegist;
    }
    
    @RequestMapping(value="/sal/out/ItemHistoryUpdate")
    @ResponseBody
  public void ItemHistoryUpdate(@RequestBody ItmOutGridDataVO gridData) throws Exception {
    	
     itemHistoryService.itemHistoryUpdate(gridData);
  } 
    
    //제품코드검색
    @RequestMapping(value="/sal/out/setItemCode", method=RequestMethod.GET)
    @ResponseBody
    public List<?> setItemCode(ItemHistoryVO searchVO ) throws Exception {
    	List<?> orderMList = itemHistoryService.setItemCode(searchVO);
        return orderMList;
       
    }
    
    @RequestMapping(value="/sal/out/setLotNum", method=RequestMethod.GET)
    @ResponseBody
    public List<?> setLotNum(ItemHistoryVO searchVO ) throws Exception {
        List<?> orderMList = itemHistoryService.setLotNum(searchVO);
        return orderMList;
       
    }
    
    @RequestMapping(value="/sal/out/setOrdNum", method=RequestMethod.GET)
    @ResponseBody
    public List<?> setOrdNum(ItemHistoryVO searchVO ) throws Exception {
        List<?> orderMList = itemHistoryService.setOrdNum(searchVO);
        return orderMList;
       
    }
    
    @RequestMapping(value="/sal/out/getItmHisNum", method=RequestMethod.GET)
    @ResponseBody
    public List<?> getItmHisNum(ItemHistoryVO searchVO ) throws Exception {
        List<?> orderMList = itemHistoryService.getItmHisNum(searchVO);
        return orderMList;
       
    }
    
    
    
    
//    @RequestMapping(value="/ItemHistoryUpdate")
//    public void ItemHistoryUpdate(ItemHistoryVO searchVO ) throws Exception {
//    	System.out.println(searchVO.getItmVol());
//       itemHistoryService.ItemHistoryUpdate(searchVO);
//    } 
//    @RequestMapping(value="/ItemHistoryNewInsert")
//    public void ItemHistoryNewInsert(ItemHistoryVO searchVO ) throws Exception {
//    	System.out.println(searchVO.getItmVol());
//       itemHistoryService.ItemHistoryNewInsert(searchVO);
//    }
//    
//    @RequestMapping(value="/ItemHistoryInsert")
//    public void ItemHistoryInsert(ItemHistoryVO searchVO ) throws Exception {
//    	System.out.println(searchVO.getItmVol()); 
//       itemHistoryService.InsertItemHistory(searchVO);
//    }
    
    
    
    @RequestMapping("/sal/out/addItemHistoryView.do")
    public String addItemHistoryView(
            @ModelAttribute("searchVO") ItemHistoryDefaultVO searchVO, Model model)
            throws Exception {
        return "sal/out/ItemHistoryRegister.page";
    }
    
    
    

    
    @RequestMapping("/sal/out/ItemHistoryRegister.do")
    public String updateItemHistoryView(
            @RequestParam("itmHisNum") java.lang.String itmHisNum ,
            @ModelAttribute("searchVO") ItemHistoryDefaultVO searchVO, Model model)
            throws Exception {
        ItemHistoryVO itemHistoryVO = new ItemHistoryVO();
        itemHistoryVO.setItmHisNum(itmHisNum);
        // 변수명은 CoC 에 따라 itemHistoryVO
        model.addAttribute(selectItemHistory(itemHistoryVO, searchVO));
        return "sal/out/ItemHistoryRegister.page";
    }

    @RequestMapping("/sal/ord/selectItemHistory.do")
    public @ModelAttribute("itemHistoryVO")
    ItemHistoryVO selectItemHistory(
            ItemHistoryVO itemHistoryVO,
            @ModelAttribute("searchVO") ItemHistoryDefaultVO searchVO) throws Exception {
        return itemHistoryService.selectItemHistory(itemHistoryVO);
    }

    @RequestMapping("/sal/ord/updateItemHistory.do")
    public String updateItemHistory(
            ItemHistoryVO itemHistoryVO,
            @ModelAttribute("searchVO") ItemHistoryDefaultVO searchVO, SessionStatus status)
            throws Exception {
        itemHistoryService.updateItemHistory(itemHistoryVO);
        status.setComplete();
        return "forward:/sal/ord/ItemHistoryList.do";
    }
    
    @RequestMapping("/sal/ord/deleteItemHistory.do")
    public String deleteItemHistory(
            ItemHistoryVO itemHistoryVO,
            @ModelAttribute("searchVO") ItemHistoryDefaultVO searchVO, SessionStatus status)
            throws Exception {
        itemHistoryService.deleteItemHistory(itemHistoryVO);
        status.setComplete();
        return "forward:/sal/ord/ItemHistoryList.do";
    }

}
