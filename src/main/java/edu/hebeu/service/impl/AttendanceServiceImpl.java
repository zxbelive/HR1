package edu.hebeu.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import edu.hebeu.entity.sign;
import edu.hebeu.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import edu.hebeu.entity.Attendance;
import edu.hebeu.entity.Employee;
import edu.hebeu.mapper.AttendanceMapper;
import edu.hebeu.mapper.EmployeeMapper;
import edu.hebeu.service.AttendanceService;
import edu.hebeu.util.MConstant;
import edu.hebeu.util.MTimeUtil;

@Service("attendanceService")
public class AttendanceServiceImpl extends ServiceImpl<AttendanceMapper, Attendance> 
	implements AttendanceService{
	
	@Autowired
	private EmployeeMapper employeeMapper;
	@Autowired
	private EmployeeService employeeService;

	//获取相关时间
	Date amTime = MTimeUtil.stringTimeParse(MConstant.AMTime);
	Date amStartTime = MTimeUtil.stringTimeParse(MConstant.AMStartTime);
	Date amEndTime = MTimeUtil.stringTimeParse(MConstant.AMEndTime);
	Date pmTime = MTimeUtil.stringTimeParse(MConstant.PMTime);
	Date pmStartTime = MTimeUtil.stringTimeParse(MConstant.PMStartTime);
	Date pmEndTime = MTimeUtil.stringTimeParse(MConstant.PMEndTime);
	Date ovTime = MTimeUtil.stringTimeParse(MConstant.OVTime);
	Date ovStartTime = MTimeUtil.stringTimeParse(MConstant.OVStartTime);
	Date ovEndTime = MTimeUtil.stringTimeParse(MConstant.OVEndTime);
	
	//200返回值为签到成功，1000为禁止重复签到
	public String addStart(Integer employeeNumber){
		//获取当前时间
		Date nowTime = MTimeUtil.nowTime();
		//获取当前日期
		Date nowDate = MTimeUtil.nowDate();
		Attendance attendance = new Attendance();
		attendance.setEmployeeNumber(employeeNumber);
		attendance.setDay(nowDate);
		attendance.setStartTime(nowTime);
		if (nowTime.after(amTime) && nowTime.before(amEndTime)) {
			Attendance att = baseMapper.selectByNumber(employeeNumber, nowDate, "上午");
			if (att == null) {
				attendance.setTimeType("上午");
				if (nowTime.before(amStartTime)) {
					attendance.setStartType("正常");
				}else{
					attendance.setStartType("迟到");
				}
				baseMapper.insert(attendance);
				return "200";
			}else{
				return "1000";
			}
		}else if(nowTime.after(pmTime) && nowTime.before(pmEndTime)){
			Attendance att = baseMapper.selectByNumber(employeeNumber, nowDate, "下午");
			if (att == null) {
				attendance.setTimeType("下午");
				if (nowTime.before(pmStartTime)) {
					attendance.setStartType("正常");
				}else{
					attendance.setStartType("迟到");
				}
				baseMapper.insert(attendance);
				return "200";
			}else {
				return "1000";
			}
		}else if(nowTime.after(ovTime) && nowTime.before(ovEndTime)){
			Attendance att = baseMapper.selectByNumber(employeeNumber, nowDate, "加班");
			if (att == null) {
				attendance.setTimeType("加班");
				if (nowTime.before(ovStartTime)) {
					attendance.setStartType("正常");
				}else{
					attendance.setStartType("迟到");
				}
				baseMapper.insert(attendance);
				return "200";
			}else {
				return "1000";
			}
		}
		return "200";

	}

	//200返回值为签到成功，1000为禁止重复签到
	public String addEnd(Integer employeeNumber) {
		Date nowTime = MTimeUtil.nowTime();
		Date nowDate = MTimeUtil.nowDate();
		if (nowTime.after(amStartTime) && nowTime.before(pmStartTime)) {
			Attendance attendance = baseMapper.selectByNumber(employeeNumber, nowDate, "上午");
			if (attendance.getEndTime() == null) {
				attendance.setEndTime(nowTime);
				if (nowTime.after(amEndTime)) {
					attendance.setEndType("正常");
				}else{
					attendance.setEndType("早退");
				}
				baseMapper.updateById(attendance);
				return "200";
			}else {
				return "1000";
			}
		}else if(nowTime.after(pmStartTime) && nowTime.before(ovStartTime)){
			Attendance attendance = baseMapper.selectByNumber(employeeNumber, nowDate, "下午");
			if (attendance.getEndTime() == null) {
				attendance.setEndTime(nowTime);
				if (nowTime.after(pmEndTime)) {
					attendance.setEndType("正常");
				}else{
					attendance.setEndType("早退");
				}
				baseMapper.updateById(attendance);
				return "200";
			}else {
				return "1000";
			}
		}else if(nowTime.after(ovStartTime)){
			Attendance attendance = baseMapper.selectByNumber(employeeNumber, nowDate, "加班");
			if (attendance.getEndTime() == null) {
				attendance.setEndTime(nowTime);
				if (nowTime.after(ovEndTime)) {
					attendance.setEndType("正常");
				}else{
					attendance.setEndType("早退");
				}
				baseMapper.updateById(attendance);
				return "200";
			}else {
				return "1000";
			}
		}
		return "200";
	}


	public List<Attendance> selectList() {
		 //查询所有的考勤记录，根据id倒序排序
		List<Attendance> list = baseMapper.selectList(new EntityWrapper<Attendance>().
				orderBy("id", false));
		for(Attendance attendance : list){
			//为attendance对象setEmployee
			Employee employee = employeeMapper.selectByNumber(attendance.getEmployeeNumber());
			attendance.setEmployee(employee);
		}
		return list;
	}


	public List<Attendance> selectByEmployee(Integer employeeNumber) {
		 //查询一个员工的考勤记录，根据id倒序排序
		List<Attendance> list = baseMapper.selectList(new EntityWrapper<Attendance>()
				.eq("employee_number", employeeNumber)
				.orderBy("id", false));
		for(Attendance attendance : list){
			//为attendance对象setEmployee
			Employee employee = employeeMapper.selectByNumber(attendance.getEmployeeNumber());
			attendance.setEmployee(employee);
		}
		return list;
	}

	public List<sign> selectatt() {
		String format = MTimeUtil.dateFormat(new Date());
		List<Attendance> day = baseMapper.selectList(new EntityWrapper<Attendance>()
				.eq("day", format)
		);
		int s=0;
		int x=0;
		int w=0;
		for (Attendance attendance : day) {
			if(attendance.getTimeType().equals("上午")){
				s++;
			}else if (attendance.getTimeType().equals("下午")){
				x++;
			}else {
				w++;
			}
		}
		Integer integer = employeeService.selectCount();
		List<sign> signList=new ArrayList<sign>();
		sign sign = new sign();
		sign.setTimetype("上午");
		sign.setQdmnumber(s);
		sign.setWqdnumber(integer-s);
		sign sign1 = new sign();
		sign1.setTimetype("下午");
		sign1.setQdmnumber(x);
		sign1.setWqdnumber(integer-x);
		sign sign2 = new sign();
		sign2.setTimetype("加班");
		sign2.setQdmnumber(w);
		sign2.setWqdnumber(integer-w);
		signList.add(sign);
		signList.add(sign1);
		signList.add(sign2);
		return signList;
	}
}