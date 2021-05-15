package edu.hebeu.service;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;

import edu.hebeu.entity.Attendance;
import edu.hebeu.entity.sign;

public interface AttendanceService extends IService<Attendance>{

	/**
	 * 插入上班记录
	 * @param employeeNumber
	 */
	String addStart(Integer employeeNumber);
	
	/**
	 * 更新下班记录
	 * @param employeeNumber
	 */
	String addEnd(Integer employeeNumber);

	/**
	 * 查询所有考勤记录
	 * @return
	 */
	List<Attendance> selectList();
	
	/**
	 * 查询一个员工的考勤记录
	 * @return
	 */
	List<Attendance> selectByEmployee(Integer employeeNumber);

    List<sign> selectatt();
}
