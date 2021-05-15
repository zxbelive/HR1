package edu.hebeu.controller;

import com.baomidou.mybatisplus.plugins.Page;
import edu.hebeu.entity.Salary;
import edu.hebeu.service.SalaryService;
import edu.hebeu.util.MTimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/salary")
public class SalaryController {
    @Autowired
    SalaryService salaryService;
    @RequestMapping("/to.do")
    public String to(Model model,int pageNo){
        Page<Salary> salaryList=salaryService.selectsalarylist(pageNo);
        model.addAttribute("salaryList",salaryList);
        return "admin/salary_list";
    }

    @RequestMapping("/{id}/toupdate.do")
    public String updatesalary(@PathVariable Integer id,Model model){
        Salary salary=salaryService.selectbyid1(id);
        model.addAttribute("salary",salary);
       return "admin/salary_update";
    }

    @RequestMapping("/{id}/update.do")
    public String updatesalarybyid(@PathVariable Integer id,Salary salary){
        salary.setInTime(new Date());
        salaryService.updatebyid(id,salary);
        return "forward:/salary/to.do?pageNo=1";
    }
}
