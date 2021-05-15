package edu.hebeu.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.mysql.cj.Session;
import edu.hebeu.entity.*;
import edu.hebeu.security.RoleSign;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;

import edu.hebeu.security.PermissionSign;
import edu.hebeu.service.DepartmentService;
import edu.hebeu.service.EmployeeService;
import edu.hebeu.service.OvertimeService;
import edu.hebeu.util.MTimeUtil;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/overtime")
public class OvertimeController {

	@Autowired
	private OvertimeService overtimeService;
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private DepartmentService departmentService;

	@RequestMapping("/{employeeNumber}/listPage.do")
	@RequiresPermissions(value = PermissionSign.OVERTIME_LIST)
	public String selectListByPgae(@PathVariable Integer employeeNumber, Model model, int pageNo){
		Page<Overtime> page = overtimeService.selectListByPage(pageNo);
		model.addAttribute("page",page);
		Employee employee = employeeService.selectByNumber(employeeNumber);
		model.addAttribute("depnum",employee.getDepartmentNumber());
		return "admin/overtime_list";
	}
	
	@RequestMapping("/{depnum}/toAdd.do")
	@RequiresPermissions(value = PermissionSign.OVERTIME_ADD_SHOW)
	public String toAdd(@PathVariable Integer depnum, Model model){
		model.addAttribute("depnum",depnum);
		//查询出所有的部门
		List<Department> dList = departmentService.selectList(new EntityWrapper<Department>());
		model.addAttribute("dList", dList);
		//查询出所有的员工
		List<Employee> eList = employeeService.selectList(new EntityWrapper<Employee>());
		model.addAttribute("eList", eList );
		return "admin/overtime_add";
	}



	@RequestMapping("/add.do")
	@RequiresPermissions(value = PermissionSign.OVERTIME_ADD_SUBMIT)
	public String add(Overtime overtime, String date, HttpSession session){
		overtime.setDay(MTimeUtil.stringParse(date));
		overtimeService.insert(overtime);
		Employee employee2 = (Employee) session.getAttribute("loged");
		Integer employeeNumber = employee2.getEmployeeNumber();
		return "forward:/overtime/"+employeeNumber+"/listPage.do?pageNo=1";
	}
	
	@RequestMapping("/{id}/toUpdate.do")
	@RequiresPermissions(value = PermissionSign.OVERTIME_UPDATE_SHOW)
	public String toUpdate(Model model, @PathVariable Integer id){
		//查询出要修改的记录信息
		Overtime overtime = overtimeService.selectById(id);
		model.addAttribute("overtime", overtime);
		//查询出所有的部门
		List<Department> dList = departmentService.selectList(new EntityWrapper<Department>());
		model.addAttribute("dList", dList);
		//查询出所有的员工
		List<Employee> eList = employeeService.selectList(new EntityWrapper<Employee>());
		model.addAttribute("eList", eList );
		return "admin/overtime_update";
	}
	
	@RequestMapping("/{id}/update.do")
	@RequiresPermissions(value = PermissionSign.OVERTIME_UPDATE_SUBMIT)
	public String updateById(@PathVariable Integer id,  String date, Overtime overtime,HttpSession session){
		overtime.setId(id);
		overtime.setDay(MTimeUtil.stringParse(date));
		overtimeService.updateById(overtime);
		Employee e = (Employee) session.getAttribute("loged");
		Integer employeeNumber = e.getEmployeeNumber();
		return "forward:/overtime/"+employeeNumber+"/listPage.do?pageNo=1";
	}
	
	@RequestMapping("/{id}/delete.do")
	@RequiresPermissions(value = PermissionSign.OVERTIME_DEL)
	public String deleteById(@PathVariable Integer id,HttpSession session){
		overtimeService.deleteById(id);
		Employee e = (Employee) session.getAttribute("loged");
		Integer employeeNumber = e.getEmployeeNumber();
		return "forward:/overtime/"+employeeNumber+"/listPage.do?pageNo=1";
	}
	
	@RequestMapping("/{employeeNumber}/oneself.do")
	public String select(Model model, @PathVariable Integer employeeNumber, int pageNo){
		Page<Overtime> page = overtimeService.selectByEmployee(pageNo, employeeNumber);
		model.addAttribute("page",page);
		return "admin/oneself_overtime";
	}

	@RequestMapping("/countlist.do")
	public String getcountbyuser(Model model){
		String startdate=null;
		String stopdate=null;
		List<overtimestatistics> overtimeMap = employeeService.selectcountlist(startdate,stopdate);
		model.addAttribute("List",overtimeMap);
		return "admin/overtime_count";
	}

	@RequestMapping("/countlistcondition.do")
	@ResponseBody
	public List<overtimestatistics> getcountbyusercondition(Model model,String startdate,String stopdate){
		if (startdate==""){
			startdate=null;
		}
		if (stopdate==""){
			stopdate=null;
		}
		List<overtimestatistics> overtimeMap = employeeService.selectcountlist(startdate,stopdate);
		return overtimeMap;
	}
	
}
