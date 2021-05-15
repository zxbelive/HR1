package edu.hebeu.controller;

import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.hebeu.entity.Attendance;
import edu.hebeu.security.PermissionSign;
import edu.hebeu.service.AttendanceService;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/attendance")
public class AttendanceController {

	@Autowired
	private AttendanceService attendanceService;
	
	@RequestMapping("/addStart.do")
    @ResponseBody
	public String addStart(Integer employeeNumber){
		String s = attendanceService.addStart(employeeNumber);
		return s;
	}

	
	@RequestMapping("/addEnd.do")
	@ResponseBody
	public String addEnd(Integer employeeNumber){
		String s = attendanceService.addEnd(employeeNumber);
		return s;
	}
	
	@RequestMapping("/list.do")
	@RequiresPermissions(value = PermissionSign.ATTENDANCE_LIST)
	public String selectList(Model model){
		List<Attendance> list = attendanceService.selectList();
		model.addAttribute("aList",list);
		return "admin/attendance_list";
	}
	
	@RequestMapping("/{employeeNumber}/oneself.do")
	public String select(Model model, @PathVariable Integer employeeNumber){
		List<Attendance> list = attendanceService.selectByEmployee(employeeNumber);
		model.addAttribute("aList",list);
		return "admin/oneself_attendance";
	}
}
