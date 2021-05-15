package edu.hebeu.service.impl;

import java.util.*;

import edu.hebeu.entity.*;
import edu.hebeu.service.SalaryService;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import edu.hebeu.mapper.MoveMapper;
import edu.hebeu.mapper.DepartmentMapper;
import edu.hebeu.mapper.EmployeeMapper;
import edu.hebeu.mapper.HistoryMapper;
import edu.hebeu.mapper.PositionMapper;
import edu.hebeu.service.EmployeeService;

@Service("employeeService")
public class EmployeeServiceImpl extends ServiceImpl<EmployeeMapper, Employee>
	implements EmployeeService{

	@Autowired
	private HistoryMapper historyMapper;
	@Autowired
	private DepartmentMapper departmentMapper;
	@Autowired
	private PositionMapper positionMapper;
	@Autowired
	private MoveMapper moveMapper;
	@Autowired
	private EmployeeMapper employeeMapper;
	@Autowired
	private HistoryServiceImpl historyService;
	@Autowired
	private SalaryService salaryService;

	/**
	 * 为employee对象setDepartment setPosition
	 * @param employee
	 * @return
	 */
	public Employee setObject(Employee employee){
		Integer departmentNumber = employee.getDepartmentNumber();
		Department  department = departmentMapper.selectByNumber(departmentNumber);
		employee.setDepartment(department);

		Integer positionNumber = employee.getPositionNumber();
		Position position = positionMapper.selectByNumber(positionNumber);
		employee.setPosition(position);
		return employee;
	}


	public Employee checkLogin(Integer employeeNumber, String password) {
		  Employee employee = baseMapper.checkLogin(employeeNumber, password);
		  if (employee != null) {
			  //为employee对象中setDepartment setPosition
			  setObject(employee);
		  }
		  return employee;
	}


	public List<Employee> select(Integer employeeNumber, String password){
		 List<Employee> eList = baseMapper.selectList(new EntityWrapper<Employee>()
				.eq("employee_number", employeeNumber)
				.eq("password", password));
		 return eList;
	}

	public List<Permis> selectpermisbyid(String username) {
		List<Permis> selectpermisbyid = employeeMapper.selectpermisbyid(username);
		return selectpermisbyid;
	}

	public List<Permis> selectrolebyid(String username) {
		List<Permis> selectrolebyid = employeeMapper.selectrolebyid(username);
		return selectrolebyid;
	}

	public List<Employee> selectEmployeebydepartment(Integer department) {
		List<Employee> employeeList = baseMapper.selectList(new EntityWrapper<Employee>().eq("department_number", department));
		return employeeList;
	}

	public List<sex> selectsexratio() {
		List<Employee> employeeList =baseMapper.selectList(new EntityWrapper<Employee>());
		int man=0;
		int woman=0;
		for (Employee employee : employeeList) {
			if(employee.getGender().equals("男")){
				man++;
			}else {
				woman++;
			}

		}
		sex sex = new sex();
		sex.setName("男");
		sex.setValue(man);
		sex sex1=new sex();
		sex1.setName("女");
		sex1.setValue(woman);
		List<sex> sexList =new ArrayList<sex>();
		sexList.add(sex);
		sexList.add(sex1);
		return sexList;
	}

	public Integer selectCount() {
		Integer integer = baseMapper.selectCount(new EntityWrapper<Employee>());
		return integer;
	}

	public List<Employee> selectall() {
		List<Employee> employeeList = baseMapper.selectList(new EntityWrapper<Employee>());
		return employeeList;
	}

	public List<Employee> selectemployeeexcel() {
		List<Employee> employeeList=employeeMapper.selectemployeeexcel();
		return employeeList;
	}

	public List<Integer> selectmanageid(Integer deparmentNumber, Integer empid) {
		List<Employee> employeeList = baseMapper.selectList(new EntityWrapper<Employee>().eq("department_number", deparmentNumber).eq("position_number", 3001));
		List<Integer> empnumberlist=new ArrayList<Integer>();
		for (Employee employee : employeeList) {
			empnumberlist.add(employee.getEmployeeNumber());
		}
		return empnumberlist;
	}

	public List<overtimestatistics> selectcountlist(String startdate, String stopdate) {
		List<overtimestatistics> list=employeeMapper.selectcountlist(startdate,stopdate);
		List<Employee> employeeList = employeeMapper.selectList(new EntityWrapper<Employee>());
		ArrayList<overtimestatistics> ovlist = new ArrayList<overtimestatistics>();
		List<Department> departments = departmentMapper.selectList(new EntityWrapper<Department>());
		for (Employee employee : employeeList) {
			overtimestatistics over = new overtimestatistics();
			over.setName(employee.getName());
			over.setEmpid(employee.getEmployeeNumber());
			for (Department department : departments) {
				if (employee.getDepartmentNumber().equals(department.getDepartmentNumber())){
					over.setDepname(department.getName());
					break;
				}
			}

			over.setCounts(0);
		for (overtimestatistics overtimestatistics : list) {

			if (overtimestatistics.getEmpid().equals(employee.getEmployeeNumber())){
				over.setCounts(overtimestatistics.getCounts());
				break;
				}
			}
			ovlist.add(over);
		}
		return ovlist;
	}


	public Page<Employee> selectListByPage(int pageNo) {
		Page<Employee> page = new Page<Employee>(pageNo, 4,"id");
		//是否为升序 ASC（ 默认： true ）
		page.setAsc(false);
		List<Employee> eList = baseMapper.selectPage(page, null);
		for(Employee e : eList){
			//为employee对象中setDepartment setPosition
			setObject(e);
		}
		page.setRecords(eList);
		return page;
	}

	public Page<Employee> selectListBystatuepage(int pageNo) {
		Page<Employee> page = new Page<Employee>(pageNo, 100,"id");
		//是否为升序 ASC（ 默认： true ）
		page.setAsc(true);

//		QueryWrapper wrapper = new QueryWrapper();
		EntityWrapper<History> entityWrapper = new EntityWrapper<History>();
		entityWrapper.eq("status","在职");

		List<History> histories = historyMapper.selectList(entityWrapper);

		List<Employee> employees = baseMapper.selectPage(page, null);

		List<Employee> eList = new ArrayList<Employee>();

		for (History history : histories) {
			for (Employee employee : employees) {
				if (employee.getEmployeeNumber().equals(history.getEmployeeNumber())){
					eList.add(employee);
					break;
				}
			}
		}

//		List<Employee> eList=employeeMapper.selectlistbystatus(page);
		for(Employee e : eList){
			//为employee对象中setDepartment setPosition
			setObject(e);
		}
		page.setRecords(eList);
		page.setTotal(eList.size());
		return page;
	}


	@Transactional

	public void addEmployee(Employee employee) {
		//向employee中插入记录
		employee.setInTime(new Date());
				//密码加密md5
				Md5Hash md5Hashpasswd = new Md5Hash(employee.getPassword());
				employee.setPassword(md5Hashpasswd.toString());
				baseMapper.insert(employee);
//				Integer role;
//				if (employee.getPositionNumber() == 3001) {
//					int salary = 10000;
//					salaryService.insertuser(employee.getEmployeeNumber(), new Date(), salary);
//					role = 3;
//				} else if (employee.getPositionNumber() == 3002) {
//					int salary = 6000;
//					salaryService.insertuser(employee.getEmployeeNumber(), new Date(), salary);
//					role = 2;
//				} else {
//					int salary = 8000;
//					salaryService.insertuser(employee.getEmployeeNumber(), new Date(), salary);
//					role = 1;
//				}
		Integer role=null;
		Integer positionNumber = employee.getPositionNumber();
		List<Position> positionList = positionMapper.selectList(new EntityWrapper<Position>().eq("position_number", positionNumber));
		for (Position position : positionList) {
			if (position.getLevel().equals("部门领导")){
				int salary=10000;
				salaryService.insertuser(employee.getEmployeeNumber(),new Date(),salary);
				role=3;
			}else if (position.getLevel().equals("部门员工")){
				int salary=6000;
				salaryService.insertuser(employee.getEmployeeNumber(),new Date(),salary);
				role=2;
			}else {
				int salary=8000;
				salaryService.insertuser(employee.getEmployeeNumber(),new Date(),salary);
				role=1;
			}
		}
		employeeMapper.insertuserrole(employee.getEmployeeNumber(), role);
				//同时向history中插入记录
				History history = new History();
				history.setEmployeeNumber(employee.getEmployeeNumber());
				history.setName(employee.getName());
				history.setGender(employee.getGender());
				history.setBirthday(employee.getBirthday());
				history.setTelephone(employee.getTelephone());
				history.setEmail(employee.getEmail());
				history.setAddress(employee.getAddress());
				history.setPhoto(employee.getPhoto());
				history.setEducation(employee.getEducation());
				history.setInTime(employee.getInTime());
				history.setDepartmentNumber(employee.getDepartmentNumber());
				history.setPositionNumber(employee.getPositionNumber());
				history.setStatus("在职");
				history.setNotes(employee.getNotes());
				historyMapper.insert(history);

		}


	public Employee selectEmployee(Integer id) {
		Employee employee = baseMapper.selectById(id);
	    //向employee对象中setDepartment setPosition
		setObject(employee);
		return employee;
	}

	@Transactional

	public void updateEmployee(Employee employee, String status, String manager) {
		//判断员工的在职状态是否改变
		if (status.equals("在职")) {
			//状态未改变，更新员工信息
			//获取员工原始信息，用于判断部门或职称是否改变
			Employee employee2 = baseMapper.selectById(employee.getId());
			Move move = new Move();
			move.setEmployeeNumber(employee.getEmployeeNumber());
			move.setTime(new Date());
			move.setManager(manager);
			//判断员工的部门是否改变，若改变向change中插入一条员工变动记录
			if(!employee.getDepartmentNumber().equals(employee2.getDepartmentNumber())){
				move.setBefore(employee2.getDepartmentNumber());
				move.setAfter(employee.getDepartmentNumber());
				moveMapper.insert(move);
				historyService.updatebid(employee.getDepartmentNumber(),employee.getEmployeeNumber());
			}
			//如果老密码与输入的密码相同则不处理
			if (!employee2.getPassword().equals(employee.getPassword()))
			{
				//密码加密md5				
				Md5Hash md5Hashpasswd = new Md5Hash(employee.getPassword());
				employee.setPassword(md5Hashpasswd.toString());
			}

			baseMapper.updateById(employee);
			historyService.updatesome(employee);
		}else{
			//状态变为离职或退休
			//删除在职员工记录
			employeeMapper.deleterolebyid(employee.getEmployeeNumber());
			salaryService.delete(new EntityWrapper<Salary>().eq("user_code",employee.getEmployeeNumber()));
			employeeMapper.delete(new EntityWrapper<Employee>().eq("employee_number",employee.getEmployeeNumber()));

			//更新员工档案的状态
			History history = historyMapper.selectByNumber(employee.getEmployeeNumber());
			history.setStatus(status);
			history.setOutTime(new Date());
			historyMapper.updateById(history);
		}
	}


	public Employee selectByNumber(Integer employeeNumber) {
		return baseMapper.selectByNumber(employeeNumber);
	}

	@Transactional

	public void deleteEmployee(Integer id) {
		//先查询再删除，否则NullPointerException
		Employee employee = baseMapper.selectById(id);
		//删除在职员工记录
		baseMapper.deleteById(id);
		//删除员工工资表信息
		salaryService.delete(new EntityWrapper<Salary>().eq("user_code",employee.getEmployeeNumber()));
		//删除员工角色表信息
        employeeMapper.deleterolebyid(employee.getEmployeeNumber());
		//将员工档案表中的状态改为离职
		History history = historyMapper.selectByNumber(employee.getEmployeeNumber());
		history.setStatus("离职");
		history.setOutTime(new Date());
		historyMapper.updateById(history);
	}


	public Page<Employee> search(String input, int pageNo) {
		Page<Employee> page = new Page<Employee>(pageNo, 4, "id");
		//是否为升序 ASC（ 默认： true ）
		page.setAsc(false);
		List<Employee> eList = baseMapper.selectPage(page, new EntityWrapper<Employee>()
				.like("name", input));
		for(Employee e : eList){
			//为employee对象中setDepartment setPosition
			setObject(e);
		}
		page.setRecords(eList);
		return page;
	}
}
