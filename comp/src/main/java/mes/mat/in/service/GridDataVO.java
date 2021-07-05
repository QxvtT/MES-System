package mes.mat.in.service;

import java.util.List;

import lombok.Data;
import mes.mat.stc.service.MaterialStockVO;

@Data
public class GridDataVO {
	List<MaterialHistoryVO> updatedRows;
	List<MaterialHistoryVO> createdRows;
	List<MaterialHistoryVO> deletedRows;
	
	MaterialStockVO materialStockVO;
}
