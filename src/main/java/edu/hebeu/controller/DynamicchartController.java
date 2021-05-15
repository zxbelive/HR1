package edu.hebeu.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import edu.hebeu.entity.*;
import edu.hebeu.service.AttendanceService;
import edu.hebeu.service.EmployeeService;
import edu.hebeu.service.HistoryService;
import edu.hebeu.service.SalaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/echarts")
public class DynamicchartController {

    @Autowired
    EmployeeService employeeService;
    @Autowired
    AttendanceService attendanceService;
    @Autowired
    SalaryService salaryService;
    @Autowired
    HistoryService historyService;

    @RequestMapping("/to.do")
    public String test(){
        return "admin/ECharts";
    }

    @RequestMapping("/to1.do")
    public String test1(){
        return "admin/attecharts";
    }

    @RequestMapping("/sexmap.do")
    @ResponseBody
    public List<sex> returnsex(){
        List<sex> sexratio = employeeService.selectsexratio();
        return sexratio;
    }
    @RequestMapping("/attmap.do")
    @ResponseBody
    public List<sign> returnattendance(){
        List<sign> selectatt = attendanceService.selectatt();
        return selectatt;
    }

    @RequestMapping("/salarymap.do")
    @ResponseBody
    public List<sex> returnsalary(){
        List<Salary> salaryList = salaryService.selectList(new EntityWrapper<Salary>().ge("basic_salary", 8000));
        List<Salary> salaryList1=salaryService.selectList(new EntityWrapper<Salary>().between("basic_salary",4000,6000));
        int i = salaryService.selectCount(new EntityWrapper<Salary>());
        sex sex = new sex();
        sex.setValue(salaryList.size());
        sex.setName("大于等于8000");
        sex sex1 = new sex();
        sex1.setValue(salaryList1.size());
        sex1.setName("4000到8000");
        sex sex2 = new sex();
        sex2.setValue(i-salaryList.size()-salaryList1.size());
        sex2.setName("小于4000");
        ArrayList<sex> sexArrayList = new ArrayList<sex>();
        sexArrayList.add(sex);
        sexArrayList.add(sex1);
        sexArrayList.add(sex2);
        return sexArrayList;
    }

    @RequestMapping("/historymap.do")
    @ResponseBody
    public List<sex> returnhistroy(){
        List<History> histories = historyService.selectList(new EntityWrapper<History>());
        //在职人数
        int zz=0;
        //离职人数
        int lz=0;
        //退休人数
        int tx=0;
        for (History history : histories) {
            if (history.getStatus().equals("在职")){
                zz++;
            }else if(history.getStatus().equals("离职")){
                lz++;
            }else {
                tx++;
            }
        }
        sex sex = new sex();
        sex.setName("在职");
        sex.setValue(zz);
        sex sex1=new sex();
        sex1.setName("离职");
        sex1.setValue(lz);
        sex sex2=new sex();
        sex2.setName("退休");
        sex2.setValue(tx);
        ArrayList<sex> sexes=new ArrayList<edu.hebeu.entity.sex>();
        sexes.add(sex);
        sexes.add(sex1);
        sexes.add(sex2);
        return sexes;
    }
}
