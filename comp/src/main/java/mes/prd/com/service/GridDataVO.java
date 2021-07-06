package mes.prd.com.service;

import java.util.List;

import lombok.Data;
@Data
public class GridDataVO {
	List<ProduceCommandDVO> createdRows;
	List<ProduceCommandDVO> deletedRows;
	List<ProduceCommandDVO> updatedRows;
	
	ProduceCommandDVO produceCommandDVO; 
}
 