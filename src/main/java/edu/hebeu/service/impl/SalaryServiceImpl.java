package edu.hebeu.service.impl;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.sun.xml.internal.ws.encoding.MtomCodec;
import edu.hebeu.entity.Attendance;
import edu.hebeu.entity.Salary;
import edu.hebeu.mapper.AttendanceMapper;
import edu.hebeu.mapper.SalaryMapper;
import edu.hebeu.service.SalaryService;
import edu.hebeu.util.MTimeUtil;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class SalaryServiceImpl extends ServiceImpl<SalaryMapper, Salary> implements SalaryService {
    @Autowired
    SalaryMapper salaryMapper;

    public Page<Salary> selectsalarylist(int pageNo) {
        Page<Salary> page=new Page<Salary>(pageNo, 5, "id");
        Integer totals = baseMapper.selectCount(new EntityWrapper<Salary>());
        page.setTotal(totals);
        List<Salary> salaryList=salaryMapper.selectsalarylist(page);
        page.setRecords(salaryList);

        return page;
    }

    public Salary selectbyid1(Integer id) {
        Salary salary = salaryMapper.selectbyid(id);
        return salary;
    }

    public void updatebyid(Integer id, Salary salary) {
        salary.setId(id);
        baseMapper.updateById(salary);
    }

    public void insertuser(Integer employeeNumber, Date date, int salary) {
        Salary salary1=new Salary();
        salary1.setBasicSalary(salary);
        salary1.setInTime(date);
        salary1.setUserCode(employeeNumber);
        baseMapper.insert(salary1);
    }
}
