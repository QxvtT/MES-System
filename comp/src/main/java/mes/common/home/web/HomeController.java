package mes.common.home.web;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import egovframework.rte.fdl.property.EgovPropertyService;
import mes.common.home.service.HomeService;
import mes.common.home.service.HomeVO;


@Controller
@SessionAttributes(types=HomeVO.class)
public class HomeController {

	@Resource(name = "homeService")
	private HomeService homeService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	/** log */
	private static final Logger LOGGER = LoggerFactory.getLogger(HomeController.class);

	
	@RequestMapping("/main.do")
    public String main()  throws Exception {
        return "common/main/Main.page";
    }
	
	@RequestMapping(value="/getOrdVol", method=RequestMethod.GET)
	@ResponseBody
	  public int getOrdVol(  ) throws Exception {
	      return homeService.getOrdVol();
	  } 
	
	@RequestMapping(value="/getBckVol", method=RequestMethod.GET)
	@ResponseBody
	  public int getBckVol(  ) throws Exception {
	      return homeService.getBckVol();
	  }
	
	@RequestMapping(value="/getComVol", method=RequestMethod.GET)
	@ResponseBody
	  public int getComVol(  ) throws Exception {
	      return homeService.getComVol();
	  }
	
	@RequestMapping(value="/getUsingMac", method=RequestMethod.GET)
	@ResponseBody
	  public int getUsingMac(  ) throws Exception {
	      return homeService.getUsingMac();
	  }
	
	@RequestMapping(value="/getMonPrice", method=RequestMethod.GET)
	@ResponseBody
	  public int getMonPrice(  ) throws Exception {
	      return homeService.getMonPrice();
	  }
	@RequestMapping(value="/getMonVol", method=RequestMethod.GET)
	@ResponseBody
	  public int getMonVol() throws Exception {
	      return homeService.getMonVol();
	  }
	@RequestMapping(value="/getOrdComVol", method=RequestMethod.GET)
	@ResponseBody
	  public int getOrdComVol() throws Exception {
	      return homeService.getOrdComVol();
	  }
	@RequestMapping(value="/getErrVol", method=RequestMethod.GET)
	@ResponseBody
	  public int getErrVol() throws Exception {
	      return homeService.getErrVol();
	  }
	
	
	
	

}