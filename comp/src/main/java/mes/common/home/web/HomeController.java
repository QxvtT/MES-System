package mes.common.home.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class HomeController {

	/** log */
	private static final Logger LOGGER = LoggerFactory.getLogger(HomeController.class);

	
	@RequestMapping("/main.do")
    public String main()  throws Exception {
        return "common/main/Main.page";
    }

}