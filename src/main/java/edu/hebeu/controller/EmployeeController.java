package edu.hebeu.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.hebeu.entity.*;
import edu.hebeu.service.impl.RoleServiceImpl;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;

import edu.hebeu.security.RoleSign;
import edu.hebeu.service.DepartmentService;
import edu.hebeu.service.EmployeeService;
import edu.hebeu.service.HistoryService;
import edu.hebeu.service.PositionService;
import edu.hebeu.util.CaptchaUtil;
import edu.hebeu.util.MTimeUtil;

@Controller
@RequestMapping("/employee")
public class EmployeeController {

	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private DepartmentService departmentService;
	@Autowired
	private PositionService positionService;
	@Autowired
	private HistoryService historyService;
	@Autowired
	private RoleServiceImpl roleService;

	@RequestMapping("/login.do")
	public String toLogin(){
		return "login";
	}
	
	
	@RequestMapping("/checkLogin.do")

	public String checkLogin(HttpSession session,HttpServletRequest request, String username,
            String password,String captcha, @RequestParam(value="isRememberMe", defaultValue="0") Integer isRememberMe) throws Exception{
		String error = null;		
		System.out.println("username:" + username + "----" + "password:" 
                + password+"captcha:"+captcha);
		
		if (username == null || username.isEmpty() || password==null || password.isEmpty())
		{
			return "login";
		}
		
		if (captcha==null ||captcha.isEmpty()){
			error = "验证码必须填写";
			request.setAttribute("error", error);
		    return "login";
		} 
		if (!session.getAttribute("randomString").equals(captcha.toUpperCase()))
		{
			  error = "验证码错误";
			  request.setAttribute("error", error);
			  return "login";			
		}
	    
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(username,
                password);
        //记住我
//        if (isRememberMe == 1) {
//            token.setRememberMe(true);
//        }
        
        try {
            subject.login(token);
        } catch (UnknownAccountException e) {
            error = "用户名/密码错误";
        } catch (IncorrectCredentialsException e) {
            error = "用户名/密码错误";
        } catch (ExcessiveAttemptsException e) {
            // TODO: handle exception
            error = "登录失败多次，账户锁定10分钟";
        }
        if (error != null) {// 出错了，返回登录页面
            request.setAttribute("error", error);
            return "login";
        } else {// 登录成功
        	
        	
        	Md5Hash md5Hash = new Md5Hash(password);
			Employee employee = employeeService.checkLogin(Integer.parseInt(username),md5Hash.toString());
			session.setAttribute("loged", employee);
			List<Permis> selectpermisbyid = employeeService.selectpermisbyid(username);


			return "admin/index5";
        	
        }
	}	

	@RequestMapping("/welcome.do")
	public String toWelcome(){
		return "welcome";
	}

	
	/*
	 * 无权限时返回的页面
	 * */
	@RequestMapping("/unauthorized.do")
	public String toUnauthorized(){
		return "unauthorized";
	}	
	
	@RequestMapping("/listPage.do")
	@RequiresRoles(value = RoleSign.ADMIN)
	public String selectList(Model model, int pageNo){
		Page<Employee> page = employeeService.selectListBystatuepage(pageNo);
		model.addAttribute("page", page);
		return "admin/employee_list";
	}
	
	@RequestMapping("/{id}/detial.do")
	public String selectEmployee(@PathVariable Integer id, Model model){
		Employee employee = employeeService.selectEmployee(id);
		model.addAttribute("employee", employee);
		return "admin/employee_detail";
	}
	
	@RequestMapping("/toAdd.do")
	@RequiresRoles(value = RoleSign.ADMIN)
	public String toAdd(Model model){
		List<History> eList = historyService.selectList(new EntityWrapper<History>()
				.orderBy("employee_number", false));
		model.addAttribute("employeeNumber",eList.get(0).getEmployeeNumber()+1);
		List<Department> dList = departmentService.selectList(new EntityWrapper<Department>());
		model.addAttribute("dList", dList);
		List<Position> pList = positionService.selectList(new EntityWrapper<Position>());
		model.addAttribute("pList", pList);
		return "admin/employee_add";
	}
	
	@RequestMapping("/add.do")
	@RequiresRoles(value = RoleSign.ADMIN)
	public String add(Employee employee, String date,Model model) {
		employee.setBirthday(MTimeUtil.stringParse(date));
		employeeService.addEmployee(employee);
		return "forward:/employee/listPage.do?pageNo=1";
	}
	
	@RequestMapping("/{id}/toUpdate.do")
	@RequiresRoles(value = RoleSign.ADMIN)
	public String toUpdate(Model model, @PathVariable Integer id){
		Employee employee = employeeService.selectById(id);
		model.addAttribute("employee", employee);
		List<Department> dList = departmentService.selectList(new EntityWrapper<Department>());
		model.addAttribute("dList", dList);
		List<Position> pList = positionService.selectList(new EntityWrapper<Position>());
		model.addAttribute("pList", pList);
		return "admin/employee_update";
	}
	
	@RequestMapping("/{id}/update.do")
	//@RequiresRoles(value = RoleSign.ADMIN)
	public String updateById(@PathVariable Integer id, Employee employee, String date, String status, 
			HttpSession session){
		employee.setId(id);
		employee.setBirthday(MTimeUtil.stringParse(date));
		//得到操作人员的名字
		Employee employee2 = (Employee) session.getAttribute("loged");
		employeeService.updateEmployee(employee, status, employee2.getName());
		if (employee.getPositionNumber()==null){
			return "forward:/employee/listPage.do?pageNo=1";
		}
		else {
			if (employee.getPositionNumber() == 3003) {
				roleService.updateroleadmin(employee.getEmployeeNumber());
			} else if (employee.getPositionNumber() == 3002) {
				roleService.updateroleemployee(employee.getEmployeeNumber());
			} else {
				roleService.updaterolemanage(employee.getEmployeeNumber());
			}
		}
		return "forward:/employee/listPage.do?pageNo=1";
	}
	
	@RequestMapping("/{id}/delete.do")
	@RequiresRoles(value = RoleSign.ADMIN)
	public String deleteById(@PathVariable Integer id){
		employeeService.deleteEmployee(id);
		return "forward:/employee/listPage.do?pageNo=1";
	}
	
	@RequestMapping("/oneself/{id}/detial.do")
	public String selectEmployee2(@PathVariable Integer id, Model model){
		Employee employee = employeeService.selectEmployee(id);
		model.addAttribute("employee", employee);
		return "admin/oneself_detail";
	}
	
	@RequestMapping("/oneself/{id}/toUpdate.do")
	public String toUpdate2(Model model, @PathVariable Integer id){
		Employee employee = employeeService.selectById(id);
		model.addAttribute("employee", employee);
		return "admin/oneself_update";
	}
	
	@RequestMapping("/search")
	
	public String search(Model model, String input, int pageNo){
		Page<Employee> page = employeeService.search(input, pageNo);
		model.addAttribute("page", page);
		return "admin/search_result";
	}
	
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session){
		session.removeAttribute("loged");
	    // 登出操作
	    Subject subject = SecurityUtils.getSubject();
	    subject.logout();
	    return "login";	
	}
	
	
	/*
	@RequestMapping("/logout1.do")
	public String logout1(HttpSession session){
		session.removeAttribute("loged");
		return "login";
	}
	*/	
	
	
	@RequestMapping(value = "/captcha.do", method = RequestMethod.GET)
	@ResponseBody
	public void captcha (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
        CaptchaUtil.outputCaptcha(request, response);
	}

	
}
