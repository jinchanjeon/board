package egovframework.example.sample.service;

import java.util.List;

public interface DeptService {
	public String InsertDept(DeptVO vo) throws Exception;
	public List<?> SelectDeptList(DeptVO vo) throws Exception;
	public DeptVO selectDeptDetail(int deptno) throws Exception;
	public int deleteDept(int deptno) throws Exception;
	public int updateDept(DeptVO vo) throws Exception;
	
}
