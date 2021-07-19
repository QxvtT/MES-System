package mes.prd.mon.service;

import lombok.Data;

@Data
public class MonitorVO {

	// 설비코드
	java.lang.String macCode;
	// 설비명
	java.lang.String macName;
	// 설비 라인번호
	java.math.BigDecimal lineNum;
	
	// 공정코드
	java.lang.String prcCdoe;
	// 공정명
	java.lang.String prcName;
	
	// 이동번호
	java.lang.String movNum;
	// 제품코드
	java.lang.String itmCode;
	// 제품명
	java.lang.String itmName;
	
	// 금일계획 = 입고량
	java.math.BigDecimal prcComDVol;
	// 현재실적, 현재불량
	java.math.BigDecimal prcResVol;
	java.math.BigDecimal prcErrVol;
	
}
