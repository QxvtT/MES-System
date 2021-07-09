package mes.mat.in.service;

import java.util.List;

import lombok.Data;
import mes.mat.stc.service.MaterialDefaultVO;

/**
 * @Class Name : MaterialVO.java
 * @Description : Material VO class
 * @Modification Information
 *
 * @author material
 * @since 2021-06-25
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
@Data
public class MaterialHistoryVO extends MaterialDefaultVO{
    private static final long serialVersionUID = 1L;
    
    /** matInDayList, matOutDayList 스크롤용 **/
    private java.lang.String matHisNum1;
    
    /** main grid 스크롤용 */
    private java.math.BigDecimal matHisDNum1;
    
    /** 작업일자 검색 **/
    private java.lang.String matHisDateS;
    private java.lang.String matHisDateE;
    
    /** 입고일자 검색 **/
    private java.lang.String sDate;
    private java.lang.String eDate;
    
    /** 자재코드 검색 **/
    private java.lang.String matCodes;
    private List<String> matCodeList;
    
    /** 업체코드 검색 **/
    private java.lang.String operCodes;
    private List<String> operCodeList;
    
    /** 수량x단가 **/
    private java.math.BigDecimal amount;
    
    /** mat_code */
    private java.lang.String matCode;
    
    /** oper_code */
    private java.lang.String operCode;
    
    /** mat_name */
    private java.lang.String matName;
    
    /** mat_barcode */
    private java.lang.String matBarcode;
    
    /** mat_size */
    private java.lang.String matSize;
    
    /** mat_unit */
    private java.lang.String matUnit;
    
    /** emp_id */
    private java.lang.String empId;
    
    /** mat_grp */
    private java.lang.String matGrp;
    
    /** mat_div */
    private java.lang.String matDiv;
    
    /** mat_kind_div */
    private java.lang.String matKindDiv;
    
    /** mat_using */
    private java.lang.String matUsing;
    
    /** mat_testing */
    private java.lang.String matTesting;
    
    /** cylinder */
    private java.lang.String cylinder;
    
    /** mat_lot_div */
    private java.lang.String matLotDiv;
    
    /** mat_safe_stock_mag */
    private java.lang.String matSafeStockMag;
    
    /** mat_safe_stock */
    private java.lang.String matSafeStock;
    
    /** mat_safe_date */
    private java.lang.String matSafeDate;
    
    /** mat_prd_date */
    private java.lang.String matPrdDate;
    
    /** mat_1m_usage */
    private java.lang.String mat1mUsage;
    
    /** mat_6m_usage */
    private java.lang.String mat6mUsage;
    
    /** mat_min_stock */
    private java.lang.String matMinStock;
    
    /** mat_max_stock */
    private java.lang.String matMaxStock;
    
    
    
    /** MAT_HIS_D_NUM */
    private java.math.BigDecimal matHisDNum;
    
    /** MAT_COM_NUM */
    private java.lang.String matComNum;
    
    /** LOT_NO */
    private java.lang.String lotNo;
    
    /** MAT_HIS_D_VOL */
    private java.math.BigDecimal matHisDVol;
    
    /** MAT_HIS_PRICE */
    private java.math.BigDecimal matHisPrice;
    
    
    
    /** MAT_HIS_NUM */
    private java.lang.String matHisNum;
    
    /** MAT_HIS_DIV */
    private java.lang.String matHisDiv;
    
    /** MAT_HIS_DATE */
    private java.lang.String matHisDate;
    
    /** MAT_OUT */
    private java.lang.String matOut;
    
    /** MAT_HIS_VOL */
    private java.math.BigDecimal matHisVol;
    

    
    
    
    /** LOT_NUM */
    private java.math.BigDecimal lotNum;
    
    /** MAT_VOL */
    private java.math.BigDecimal matVol;
    
    
    
    /** MAT_ORD_NUM */
    private java.math.BigDecimal matOrdNum;
    
    /** MAT_ORD_DATE */
    private java.sql.Date matOrdDate;
    
    /** MAT_ORD_OPER */
    private java.lang.String matOrdOper;
    
    /** MAT_COM_DATE */
    private java.sql.Date matComDate;
    
    /** MAT_ORD_VOL */
    private java.math.BigDecimal matOrdVol;
    
    /** MAT_NORD_VOL */
    private java.math.BigDecimal matNordVol;
    
    /** MAT_ORD_NOTE */
    private java.lang.String matOrdNote;
    
    /** MAT_ORD_NOTE */
    private java.lang.String prcCode;
    
}
