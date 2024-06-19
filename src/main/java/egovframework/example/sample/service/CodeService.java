package egovframework.example.sample.service;

import java.util.List;

public interface CodeService {

	public String insertCodes(CodeVO vo) throws Exception;
	public List<?> selectCodesList(CodeVO vo) throws Exception;
	public int selectCodesCount(CodeVO vo) throws Exception;
	public int deleteCodes(int code) throws Exception;
	public CodeVO selectCodesDetail(int code) throws Exception;
	public int updateCodes(CodeVO vo) throws Exception;
	
}
