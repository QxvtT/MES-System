package mes.prd.pln.service;

import java.util.List;

import lombok.Data;

@Data
public class GridData {
	List<ProducePlanDVO> updatedRows;
	List<ProducePlanDVO> createdRows;
	List<ProducePlanDVO> deletedRows;
	
	ProducePlanDVO producePlanDVO;
}
