package edu.hebeu.service;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import edu.hebeu.entity.Attendance;
import edu.hebeu.entity.Salary;

import java.util.Date;
import java.util.List;

public interface SalaryService extends IService<Salary> {
    Page<Salary> selectsalarylist(int pageNo);

    Salary selectbyid1(Integer id);

    void updatebyid(Integer id, Salary salary);

    void insertuser(Integer employeeNumber, Date date, int salary);
}
