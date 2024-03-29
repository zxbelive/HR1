package edu.hebeu.controller;

import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;


import edu.hebeu.security.PermissionSign;
import edu.hebeu.security.RoleSign;

import edu.hebeu.entity.Department;
import edu.hebeu.service.DepartmentService;

@Controller
@RequestMapping("/department")
public class DepartmentController {

	@Autowired
	private DepartmentService departmentService;
	
	@RequestMapping("/listPage.do")
	@RequiresRoles(value = RoleSign.ADMIN)
	@RequiresPermissions(value = PermissionSign.DEPART_QUERY)
	public String selectListByPgae(Model model, int pageNo){
		Page<Department> page = departmentService.selectListByPage(pageNo);
		model.addAttribute("page",page);
		return "admin/department_list";
	}
	
	@RequestMapping("/toAdd.do")
	@RequiresRoles(value = RoleSign.ADMIN)
	@RequiresPermissions(value = PermissionSign.DEPART_ADD_SHOW)
	public String toAdd(Model model){
		List<Department> dList = departmentService.selectList(new EntityWrapper<Department>()
				.orderBy("department_number", false));
		model.addAttribute("departmentNumber", dList.get(0).getDepartmentNumber()+1);
		return "admin/department_add";
	}
	
	@RequestMapping("/add.do")
	@RequiresRoles(value = RoleSign.ADMIN)
	@RequiresPermissions(value = PermissionSign.DEPART_ADD_SUBMIT)
	public String add(Department department){
		department.setManager("");
		departmentService.insert(department);
		return "forward:/department/listPage.do?pageNo=1";
	}
	
	@RequestMapping("/{id}/toUpdate.do")
	@RequiresRoles(value = RoleSign.ADMIN)
	@RequiresPermissions(value = PermissionSign.DEPART_UPDATE_SHOW)
	public String toUpdate(@PathVariable Integer id, Model model){
		Department department = departmentService.selectById(id);
		model.addAttribute("department", department);
		return "admin/department_update";
	}
	
	@RequestMapping("/{id}/update.do")
	@RequiresRoles(value = RoleSign.ADMIN)
	@RequiresPermissions(value = PermissionSign.DEPART_UPDATE_SUBMIT)
	public String updateById(@PathVariable Integer id, Department department){
		department.setId(id);
		departmentService.updateById(department);
		return "forward:/department/listPage.do?pageNo=1";
	}
	
	@RequestMapping("/{id}/delete.do")
	@RequiresRoles(value = RoleSign.ADMIN)
    @RequiresPermissions(value = PermissionSign.DEPART_DEL)
	public String deleteById(@PathVariable Integer id){
		departmentService.deleteById(id);
		return "forward:/department/listPage.do?pageNo=1";
	}
	
}
