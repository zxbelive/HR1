package edu.hebeu.service.impl;

import java.util.ArrayList;
import java.util.List;

import edu.hebeu.entity.*;
import edu.hebeu.mapper.RoleMapper;
import edu.hebeu.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import edu.hebeu.mapper.DepartmentMapper;
import edu.hebeu.mapper.EmployeeMapper;
import edu.hebeu.mapper.LeaveMapper;
import edu.hebeu.service.LeaveService;

import javax.swing.*;

@Service
public class LeavaServiceImpl extends ServiceImpl<LeaveMapper, Leave> 
	implements LeaveService{

	@Autowired
	private EmployeeMapper employeeMapper;
	@Autowired
	private DepartmentMapper departmentMapper;
	@Autowired
	private LeaveMapper leaveMapper;
	@Autowired
	private EmployeeService employeeService;
	
	/**
	 * 为leave对象setEmployee setDepartment
	 * @param leave
	 * @return
	 */
	public Leave setObject(Leave leave){
		Integer employeeNumber = leave.getEmployeeNumber();
		Employee employee = employeeMapper.selectByNumber(employeeNumber);
		leave.setEmployee(employee);
		
		Integer departmentNumber = leave.getDepartmentNumber();
		Department  department = departmentMapper.selectByNumber(departmentNumber);
		leave.setDepartment(department);
		return leave;
	}
	

	public List<Leave> selectList() {
		List<Leave> list = baseMapper.selectList(new EntityWrapper<Leave>()
				.orderBy("start_time",false));
		for(Leave leave : list){
			//为leave对象setEmployee setDepartment
			setObject(leave);
		}
		return list;
	}


	public Leave selectLeave(Integer id) {
		Leave leave = baseMapper.selectById(id);
		//为leave对象setEmployee setDepartment
		setObject(leave);
		return leave;
	}


	public void updateStatus(Integer id) {
		Leave leave = baseMapper.selectById(id);
		leave.setStatus("已批准");
		baseMapper.updateById(leave);
	}


	public Page<Leave> seletByEmployee(Integer employeeNumber, int pageNo) {
		Page<Leave> page = new Page<Leave>(pageNo, 2,"status");
		//是否为升序 ASC（ 默认： true ）
		page.setAsc(false);
		List<Leave> list = baseMapper.selectPage(page, new EntityWrapper<Leave>()
				.eq("employee_number", employeeNumber));
		for(Leave leave : list){
			//为leave对象setEmployee setDepartment
			setObject(leave);
		}
		page.setRecords(list);
		return page;
	}


	public List<Leave> selectListByStatu(Integer deparmentNumber, String status,Integer empid) {
		int role= leaveMapper.selectrole(empid);
		//部门领导批阅部门员工请假
		if (role==3) {
			List<Leave> list = baseMapper.selectList(new EntityWrapper<Leave>()
						.eq("department_number", deparmentNumber)
						.eq("status", status)
						.orderBy("id", false));
			List<Integer> id = employeeService.selectmanageid(deparmentNumber,empid);
			ArrayList<Leave> arrayList=new ArrayList<Leave>();
			for (Integer integer : id) {
				for (Leave leave : list) {
					System.out.println(leave.getEmployeeNumber());
					System.out.println(integer);
					if (!leave.getEmployeeNumber().equals(integer)){
						arrayList.add(leave);
					}
				}
			}
			for (Leave leave : arrayList) {
					//为leave对象setEmployee setDepartment
					setObject(leave);
				}
				return arrayList;
		}else if(role==1 && empid !=1001){
			//人事批阅部门经理请假
			List<Leave> leavesList=new ArrayList<Leave>();
			List<Leave> list = baseMapper.selectList(new EntityWrapper<Leave>()
					.eq("status",status)
					.orderBy("id",false));

			for (int i=0;i< list.size();i++){
				int empnumber=list.get(i).getEmployeeNumber();
				int role1 = leaveMapper.selectrole(empnumber);
				if (role1==3){
					leavesList.add(list.get(i));
				}
			}
			for (Leave leave : leavesList) {
				//为leave对象setEmployee setDepartment
				setObject(leave);
			}
			return leavesList;
		}else {
			List<Leave> leavesList=new ArrayList<Leave>();
			List<Leave> list = baseMapper.selectList(new EntityWrapper<Leave>()
					.eq("status",status)
					.orderBy("id",false));

			for (int i=0;i< list.size();i++){
				int empnumber=list.get(i).getEmployeeNumber();
				int role1 = leaveMapper.selectrole(empnumber);
				if (role1==3 ||role1==1){
					leavesList.add(list.get(i));
				}
			}
			for (Leave leave : leavesList) {
				//为leave对象setEmployee setDepartment
				setObject(leave);
			}
			return leavesList;
		}
	}
	public List<Leave> selectListByStatus(Integer deparmentNumber, String status) {
		List<Leave> list = baseMapper.selectList(new EntityWrapper<Leave>()
				.eq("department_number", deparmentNumber)
				.eq("status", status)
				.orderBy("id", false));
		for (Leave leave : list) {
			//为leave对象setEmployee setDepartment
			setObject(leave);
		}
		return list;
	}

}
