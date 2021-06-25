package mes.sal.ord.web;

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

import mes.sal.ord.service.OrderMService;
import mes.sal.ord.service.OrderMDefaultVO;
import mes.sal.ord.service.OrderMVO;

/**
 * @Class Name : OrderMController.java
 * @Description : OrderM Controller class
 * @Modification Information
 *
 * @author seongwon
 * @since 2021-06-25
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Controller
@SessionAttributes(types=OrderMVO.class)
public class OrderMController {

    @Resource(name = "orderMService")
    private OrderMService orderMService;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
    /**
	 * ORDER_M 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 OrderMDefaultVO
	 * @return "/orderM/OrderMList"
	 * @exception Exception
	 */
    @RequestMapping(value="/OrderMList.do")
    public String selectOrderMList(@ModelAttribute("searchVO") OrderMDefaultVO searchVO, 
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
		
        List<?> orderMList = orderMService.selectOrderMList(searchVO);
        model.addAttribute("resultList", orderMList);
        
        int totCnt = orderMService.selectOrderMListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        
        return "sal/ord/OrderMList.page";
    } 
    
    @RequestMapping("/orderM/addOrderMView.do")
    public String addOrderMView(
            @ModelAttribute("searchVO") OrderMDefaultVO searchVO, Model model)
            throws Exception {
        model.addAttribute("orderMVO", new OrderMVO());
        return "/orderM/OrderMRegister";
    }
    
    @RequestMapping("/orderM/addOrderM.do")
    public String addOrderM(
            OrderMVO orderMVO,
            @ModelAttribute("searchVO") OrderMDefaultVO searchVO, SessionStatus status)
            throws Exception {
        orderMService.insertOrderM(orderMVO);
        status.setComplete();
        return "forward:/orderM/OrderMList.do";
    }
    
    @RequestMapping("/orderM/updateOrderMView.do")
    public String updateOrderMView(
            @RequestParam("ordNum") java.lang.String ordNum ,
            @ModelAttribute("searchVO") OrderMDefaultVO searchVO, Model model)
            throws Exception {
        OrderMVO orderMVO = new OrderMVO();
        orderMVO.setOrdNum(ordNum);
        // 변수명은 CoC 에 따라 orderMVO
        model.addAttribute(selectOrderM(orderMVO, searchVO));
        return "/orderM/OrderMRegister";
    }

    @RequestMapping("/orderM/selectOrderM.do")
    public @ModelAttribute("orderMVO")
    OrderMVO selectOrderM(
            OrderMVO orderMVO,
            @ModelAttribute("searchVO") OrderMDefaultVO searchVO) throws Exception {
        return orderMService.selectOrderM(orderMVO);
    }

    @RequestMapping("/orderM/updateOrderM.do")
    public String updateOrderM(
            OrderMVO orderMVO,
            @ModelAttribute("searchVO") OrderMDefaultVO searchVO, SessionStatus status)
            throws Exception {
        orderMService.updateOrderM(orderMVO);
        status.setComplete();
        return "forward:/orderM/OrderMList.do";
    }
    
    @RequestMapping("/orderM/deleteOrderM.do")
    public String deleteOrderM(
            OrderMVO orderMVO,
            @ModelAttribute("searchVO") OrderMDefaultVO searchVO, SessionStatus status)
            throws Exception {
        orderMService.deleteOrderM(orderMVO);
        status.setComplete();
        return "forward:/orderM/OrderMList.do";
    }

}
