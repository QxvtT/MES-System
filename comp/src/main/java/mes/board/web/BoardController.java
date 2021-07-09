package mes.board.web;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cmm.web.EgovComIndexController;
import egovframework.com.uat.uia.service.EgovLoginService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import mes.board.service.BoardService;
import mes.board.service.BoardDefaultVO;
import mes.board.service.BoardVO;

/**
 * @Class Name : BoardController.java
 * @Description : Board Controller class
 * @Modification Information
 *
 * @author soyeon
 * @since 20210621
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
 
@Controller
@SessionAttributes(types=BoardVO.class)
public class BoardController {

    @Resource(name = "boardService")
    private BoardService boardService;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
    
    private static final Logger LOGGER = LoggerFactory.getLogger(EgovComIndexController.class);
    
    /** EgovLoginService */
	@Resource(name = "loginService")
	private EgovLoginService loginService;
	
    
  //메인화면 불러오기
  	@RequestMapping("/board/BoardList.do")
  	public String setContent(ModelMap model) throws Exception {

  		// 설정된 비밀번호 유효기간을 가져온다. ex) 180이면 비밀번호 변경후 만료일이 앞으로 180일 
  		String propertyExpirePwdDay = EgovProperties.getProperty("Globals.ExpirePwdDay");
  		int expirePwdDay = 0 ;
  		try {
  			expirePwdDay =  Integer.parseInt(propertyExpirePwdDay);
  		} catch (Exception e) {
  			LOGGER.debug("convert expirePwdDay Err : "+e.getMessage());
  		}
  		
  		model.addAttribute("expirePwdDay", expirePwdDay);

  		// 비밀번호 설정일로부터 몇일이 지났는지 확인한다. ex) 3이면 비빌번호 설정후 3일 경과
  		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
  		model.addAttribute("loginVO", loginVO);
  		int passedDayChangePWD = 0;
  		if ( loginVO != null ) {
  			LOGGER.debug("===>>> loginVO.getId() = "+loginVO.getId());
  			LOGGER.debug("===>>> loginVO.getUniqId() = "+loginVO.getUniqId());
  			LOGGER.debug("===>>> loginVO.getUserSe() = "+loginVO.getUserSe());
  			// 비밀번호 변경후 경과한 일수
  			passedDayChangePWD = loginService.selectPassedDayChangePWD(loginVO);
  			LOGGER.debug("===>>> passedDayChangePWD = "+passedDayChangePWD);
  			model.addAttribute("passedDay", passedDayChangePWD);
  		}
  		
  		// 만료일자로부터 경과한 일수 => ex)1이면 만료일에서 1일 경과
  		model.addAttribute("elapsedTimeExpiration", passedDayChangePWD - expirePwdDay);
  		
  		return "egovframework/com/cmm/EgovUnitContent";
  	}
  	
  	
    /**
	 * BOARD 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 BoardDefaultVO
	 * @return "/board/BoardList"
	 * @exception Exception
	 */
//    @RequestMapping(value="/board/BoardList.do")
//    public String selectBoardList(@ModelAttribute("searchVO") BoardDefaultVO searchVO, 
//    		ModelMap model)
//            throws Exception {
//    	
//    	/** EgovPropertyService.sample */
//    	searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
//    	searchVO.setPageSize(propertiesService.getInt("pageSize"));
//    	
//    	/** pageing */
//    	PaginationInfo paginationInfo = new PaginationInfo();
//		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
//		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
//		paginationInfo.setPageSize(searchVO.getPageSize());
//		
//		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
//		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
//		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
//		
//        List<?> boardList = boardService.selectBoardList(searchVO);
//        model.addAttribute("resultList", boardList);
//        
//        int totCnt = boardService.selectBoardListTotCnt(searchVO);
//		paginationInfo.setTotalRecordCount(totCnt);
//        model.addAttribute("paginationInfo", paginationInfo);
//        System.out.println("Test123123123");
//        return "board/BoardList.page";
//    } 
    
    @RequestMapping("/board/addBoardView.do")
    public String addBoardView(
            @ModelAttribute("searchVO") BoardDefaultVO searchVO, Model model)
            throws Exception {
        model.addAttribute("boardVO", new BoardVO());
        return "board/BoardRegister.page";
    }
    
    @RequestMapping("/board/addBoard.do")
    public String addBoard(
            BoardVO boardVO,
            @ModelAttribute("searchVO") BoardDefaultVO searchVO, SessionStatus status)
            throws Exception {
        boardService.insertBoard(boardVO);
        status.setComplete();
        return "forward:/board/BoardList.do";
    }
    
    @RequestMapping("/board/updateBoardView.do")
    public String updateBoardView(
            @RequestParam("no") java.math.BigDecimal no ,
            @ModelAttribute("searchVO") BoardDefaultVO searchVO, Model model)
            throws Exception {
        BoardVO boardVO = new BoardVO();
        boardVO.setNo(no);
        // 변수명은 CoC 에 따라 boardVO
        model.addAttribute(selectBoard(boardVO, searchVO));
        return "board/BoardRegister.page";
    }

    @RequestMapping("/board/selectBoard.do")
    public @ModelAttribute("boardVO")
    BoardVO selectBoard(
            BoardVO boardVO,
            @ModelAttribute("searchVO") BoardDefaultVO searchVO) throws Exception {
        return boardService.selectBoard(boardVO);
    }

    @RequestMapping("/board/updateBoard.do")
    public String updateBoard(
            BoardVO boardVO,
            @ModelAttribute("searchVO") BoardDefaultVO searchVO, SessionStatus status)
            throws Exception {
        boardService.updateBoard(boardVO);
        status.setComplete();
        return "forward:/board/BoardList.do";
    }
    
    @RequestMapping("/board/deleteBoard.do")
    public String deleteBoard(
            BoardVO boardVO,
            @ModelAttribute("searchVO") BoardDefaultVO searchVO, SessionStatus status)
            throws Exception {
        boardService.deleteBoard(boardVO);
        status.setComplete();
        return "forward:/board/BoardList.do";
    }
    
    

}
