package edu.hebeu.mapper;

import com.baomidou.mybatisplus.plugins.Page;
import edu.hebeu.entity.Permis;
import edu.hebeu.entity.UserRole;
import edu.hebeu.entity.overtimestatistics;
import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;

import edu.hebeu.entity.Employee;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.HashMap;
import java.util.List;

public interface EmployeeMapper extends BaseMapper<Employee>{

	/**
	 * 登录验证
	 * @param employeeNumber
	 * @param password
	 * @return
	 */
	Employee checkLogin(@Param("employeeNumber")Integer employeeNumber, 
			@Param("password")String password);
	
	/**
	 * 根据employeeNumber查询信息
	 * @param employeeNumber
	 * @return
	 */
	Employee selectByNumber(Integer employeeNumber);

	List<Permis> selectpermisbyid(String username);

    List<Permis> selectrolebyid(String username);

    //List<Employee> selectlistbystatus();

	List<Employee> selectlistbystatus(Page<?> page);


	void insertuserrole(@Param("employeeNumber") Integer employeeNumber,@Param("role") Integer role);

    List<Employee> selectemployeeexcel();

	void deleterolebyid(Integer employeeNumber);

    List<overtimestatistics> selectcountlist(@Param("startdate") String startdate, @Param("stopdate") String stopdate);
}
