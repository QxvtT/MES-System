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
 *      Copyright (C) All right reserved.
 */

@Data
public class EmployeesVO extends OperationDefaultVO {
	private static final long serialVersionUID = 1L;

	// 인사

	private java.lang.String empId;

	private java.lang.String roleCode;

	private java.lang.String empNum;

	private java.lang.String empName;

	private java.lang.String department;

	private java.lang.String hireDate;

	private java.lang.String fire;

	private java.lang.String fireDate;

	private java.lang.String adr;

	private java.lang.String adrD;

	private java.lang.String post;

	private java.lang.String email;

	private java.lang.String tell;

	private java.lang.String phone;

	private java.lang.String salary;

	private java.lang.String birth;
	
	private java.lang.String empNote;
	
	private java.lang.String position;
	
	private java.lang.String password;
	
	private java.lang.String worker;
	
	
	// 스크롤용
	
	private java.lang.String empId1;

}