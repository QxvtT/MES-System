package comp;

import egovframework.com.utl.sim.service.EgovFileScrty;

public class PassTest {

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		String a = EgovFileScrty.encryptPassword("rhdxhd12", "C02");
		System.out.println(a);
	}

}
