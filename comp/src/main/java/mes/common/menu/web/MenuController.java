package mes.common.menu.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.EgovComponentChecker;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.config.EgovLoginConfig;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.service.Globals;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.uat.uia.service.EgovLoginService;
import egovframework.com.utl.fcc.service.EgovStringUtil;
import egovframework.com.utl.sim.service.EgovClntInfo;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import mes.common.menu.service.MenuService;

/*
import com.gpki.gpkiapi.cert.X509Certificate;
import com.gpki.servlet.GPKIHttpServletRequest;
import com.gpki.servlet.GPKIHttpServletResponse;
*/

/**
 * 일반 로그인, 인증서 로그인을 처리하는 컨트롤러 클래스
 * @author 공통서비스 개발팀 박지욱
 * @since 2009.03.06
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일               수정자            수정내용
 *  ----------   --------   ---------------------------
 *  2009.03.06   박지욱           최초 생성
 *  2011.08.26   정진오           IncludedInfo annotation 추가
 *  2011.09.07   서준식           스프링 시큐리티 로그인 및 SSO 인증 로직을 필터로 분리
 *  2011.09.25   서준식           사용자 관리 컴포넌트 미포함에 대한 점검 로직 추가
 *  2011.09.27   서준식           인증서 로그인시 스프링 시큐리티 사용에 대한 체크 로직 추가
 *  2011.10.27   서준식           아이디 찾기 기능에서 사용자 리름 공백 제거 기능 추가
 *  2017.07.21   장동한           로그인인증제한 작업
 *  2018.10.26   신용호           로그인 화면에 message 파라미터 전달 수정
 *  2019.10.01   정진호           로그인 인증세션 추가
 *  2020.06.25   신용호           로그인 메시지 처리 수정
 *  2021.01.15   신용호           로그아웃시 권한 초기화 추가 : session 모드 actionLogout()
 *  
 *  </pre>
 */
@Controller
public class MenuController {

	/** EgovLoginService */
	@Resource(name = "menuService")
	private MenuService menuService;

	/** EgovCmmUseService */
	@Resource(name = "EgovCmmUseService")
	private EgovCmmUseService cmmUseService;

	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	@Resource(name = "egovLoginConfig")
	EgovLoginConfig egovLoginConfig;

	/** log */
	private static final Logger LOGGER = LoggerFactory.getLogger(MenuController.class);

	
	/**
	 * 로그아웃한다.
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping(value = "/selectMenuList")
	@ResponseBody
	public String selectMenuList(HttpServletRequest request, ModelMap model) throws Exception {
		System.out.println("세션값 확인");
		System.out.println(request.getSession().getAttribute("LoginVO"));
		System.out.println(request.getSession().getAttributeNames());
		//menuService.selectMenuList(null);
		
		return null;
	}

	

}