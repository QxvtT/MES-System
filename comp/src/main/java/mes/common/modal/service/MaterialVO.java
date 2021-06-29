package mes.common.modal.service;

import lombok.Data;

/**
 * @Class Name : OperationVO.java
 * @Description : Operation VO class
 * @Modification Information
 *
 * @author sunghwan
 * @since 2021-06-29
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Data
public class MaterialVO extends OperationDefaultVO{
    private static final long serialVersionUID = 1L;
    
  
    // 자재검색
    private java.lang.String operName;

    private java.lang.String matCode;

    private java.lang.String matName;
    
    private java.lang.String matSize;
    

    
  

 
}
