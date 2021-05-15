package edu.hebeu.service;

import java.util.HashMap;
import java.util.List;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;

import edu.hebeu.entity.Employee;
import edu.hebeu.entity.Permis;
import edu.hebeu.entity.overtimestatistics;
import edu.hebeu.entity.sex;

public interface EmployeeService extends IService<Employee>{

	/**
	 * 登录验证
	 * @param employeeNumber
	 * @param password
	 * @return
	 */
	Employee checkLogin(Integer employeeNumber, String password);
	
	/**
	 * 分页查询所有员工（倒序）
	 * @return
	 */
	Page<Employee> selectListByPage(int pageNo);

	/**
	 * 分页查询所有在职员工（倒序）
	 * @return
	 */
	Page<Employee> selectListBystatuepage(int pageNo);
	
	/**
	 * 添加员工（同时插入到员工表和员工档案表）
	 * @param employee
	 * @return
	 */
	void addEmployee(Employee employee);
	
	/**
	 * 查询一个员工的信息
	 * @param id
	 * @return
	 */
	Employee selectEmployee(Integer id);
	
	/**
	 * 更新员工信息
	 * @param employee
	 * @param status
	 */
	void updateEmployee(Employee employee,String status,String manager);
	
	/**
	 * 删除员工信息
	 * @param id
	 */
	void deleteEmployee(Integer id);
	
	/**
	 * 根据employeeNumber查询信息
	 * @param employeeNumber
	 * @return
	 */
	Employee selectByNumber(Integer employeeNumber);
	
	/**
	 * 根据输入查询员工信息
	 * @param input
	 * @return
	 */
	Page<Employee> search(String input, int pageNo);
	
	/**
	 * 测试SQL拼接
	 * @param employeeNumber
	 * @param password
	 * @return
	 */
	List<Employee> select(Integer employeeNumber, String password);

	List<Permis> selectpermisbyid(String username);

	List<Permis> selectrolebyid(String username);


	List<Employee> selectEmployeebydepartment(Integer department);

    List<sex> selectsexratio();

    Integer selectCount();

	List<Employee> selectall();

	List<Employee> selectemployeeexcel();


	List<Integer> selectmanageid(Integer deparmentNumber, Integer empid);

    List<overtimestatistics> selectcountlist(String startdate, String stopdate);
}
