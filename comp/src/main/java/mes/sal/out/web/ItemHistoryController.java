package mes.sal.out.web;

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
    
    
    @RequestMapping(value="/ItemHistoryList", method=RequestMethod.GET)
    @ResponseBody
    public List<?> ajax(ItemHistoryVO searchVO ) throws Exception {
    	
        List<?> ItemHistoryList = itemHistoryService.selectItemHistoryList(searchVO);
        return ItemHistoryList;
    }
    @RequestMapping(value="/ItemHistoryList.do")
    public String selectItemHistoryList(@ModelAttribute("searchVO") ItemHistoryDefaultVO searchVO, 
    		ModelMap model)
            throws Exception {

        return "sal/out/ItemHistoryList.page";
    } 
    
    @RequestMapping("/addItemHistoryView.do")
    public String addItemHistoryView(
            @ModelAttribute("searchVO") ItemHistoryDefaultVO searchVO, Model model)
            throws Exception {
        model.addAttribute("itemHistoryVO", new ItemHistoryVO());
        return "sal/out//ItemHistoryRegister.page";
    }
    
    @RequestMapping("/addItemHistory.do")
    public String addItemHistory(
            ItemHistoryVO itemHistoryVO,
            @ModelAttribute("searchVO") ItemHistoryDefaultVO searchVO, SessionStatus status)
            throws Exception {
        itemHistoryService.insertItemHistory(itemHistoryVO);
        status.setComplete();
        return "forward:/ItemHistoryList.do";
    }
    
    @RequestMapping("/updateItemHistoryView.do")
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

    @RequestMapping("/selectItemHistory.do")
    public @ModelAttribute("itemHistoryVO")
    ItemHistoryVO selectItemHistory(
            ItemHistoryVO itemHistoryVO,
            @ModelAttribute("searchVO") ItemHistoryDefaultVO searchVO) throws Exception {
        return itemHistoryService.selectItemHistory(itemHistoryVO);
    }

    @RequestMapping("/updateItemHistory.do")
    public String updateItemHistory(
            ItemHistoryVO itemHistoryVO,
            @ModelAttribute("searchVO") ItemHistoryDefaultVO searchVO, SessionStatus status)
            throws Exception {
        itemHistoryService.updateItemHistory(itemHistoryVO);
        status.setComplete();
        return "forward:/ItemHistoryList.do";
    }
    
    @RequestMapping("/deleteItemHistory.do")
    public String deleteItemHistory(
            ItemHistoryVO itemHistoryVO,
            @ModelAttribute("searchVO") ItemHistoryDefaultVO searchVO, SessionStatus status)
            throws Exception {
        itemHistoryService.deleteItemHistory(itemHistoryVO);
        status.setComplete();
        return "forward:/ItemHistoryList.do";
    }

}
