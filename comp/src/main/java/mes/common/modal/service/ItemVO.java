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
public class ItemVO extends OperationDefaultVO{
    private static final long serialVersionUID = 1L;
        
    // 제품

    private java.lang.String itmCode;
    
    private java.lang.String itmName;

    private java.lang.String itmSize;




 
}
