package edu.hebeu.service.impl;

import java.util.List;

import edu.hebeu.entity.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import edu.hebeu.entity.Department;
import edu.hebeu.entity.History;
import edu.hebeu.entity.Position;
import edu.hebeu.mapper.DepartmentMapper;
import edu.hebeu.mapper.HistoryMapper;
import edu.hebeu.mapper.PositionMapper;
import edu.hebeu.service.HistoryService;

@Service
public class HistoryServiceImpl extends ServiceImpl<HistoryMapper, History>
	implements HistoryService{
	
	@Autowired
	private DepartmentMapper departmentMapper;
	@Autowired
	private PositionMapper positionMapper;
	@Autowired
	private HistoryMapper historyMapper;
	
	/**
	 * history对象setDepartment setPosition
	 * @param history
	 * @return
	 */
	public History setObject(History history){
		Integer departmentNumber = history.getDepartmentNumber();
		if (departmentNumber != null) {
			Department  department = departmentMapper.selectByNumber(departmentNumber);
			history.setDepartment(department);
		}else{
			history.setDepartment(null);
		}
		Integer positionNumber = history.getPositionNumber();
		if (positionNumber != null) {
			Position position = positionMapper.selectByNumber(positionNumber);
			history.setPosition(position);
		}else{
			history.setPosition(null);
		}
		return history;
	}


	public Page<History> selectRetireByPage(int pageNo) {
		Page<History> page = new Page<History>(pageNo, 5, "id");
		//是否为升序 ASC（ 默认： true ）
		page.setAsc(false);
		List<History> hList = baseMapper.selectRetireByPage(page);
		for(History h : hList){
			setObject(h);
		}
		page.setRecords(hList);
		return page;
	}


	public History selectHistory(Integer id) {
		History history = baseMapper.selectById(id);
		setObject(history);
		return history;
	}
	

	public Page<History> selectLisByPage(int pageNo) {
		Page<History> page = new Page<History>(pageNo, 5);
		//是否为升序 ASC（ 默认： true ）
		page.setAsc(false);
		List<History> hList = baseMapper.selectPage(page, null);
		for(History h : hList){
			setObject(h);
		}
		page.setRecords(hList);
		return page;
	}


	public History selectByNumber(Integer employeeNumber) {
		return baseMapper.selectByNumber(employeeNumber);
	}


	public List<History> selectList() {
		List<History> hList = baseMapper.selectList(new EntityWrapper<History>());
		for(History h : hList){
			setObject(h);
		}
		return hList;
	}

	public void updatesome(Employee employee) {
		History history1 = baseMapper.selectByNumber(employee.getEmployeeNumber());
		History history = new History();
		history.setId(history1.getId());
		history.setEmployeeNumber(employee.getEmployeeNumber());
		history.setName(employee.getName());
		history.setGender(employee.getGender());
		history.setBirthday(employee.getBirthday());
		history.setPhoto(employee.getPhoto());
		history.setEmail(employee.getEmail());
		history.setPhoto(employee.getPhoto());
		history.setAddress(employee.getAddress());
		history.setEducation(employee.getEducation());
		history.setPositionNumber(employee.getPositionNumber());
		baseMapper.updateById(history);
	}

	public void updatebid(Integer departmentNumber, Integer employeeNumber) {
		historyMapper.updatebid(departmentNumber,employeeNumber);
	}

	public List<History> selectonjob() {
		List<History> hList = baseMapper.selectList(new EntityWrapper<History>());
		for(History h : hList){
			setObject(h);
		}
		return hList;
	}
}
