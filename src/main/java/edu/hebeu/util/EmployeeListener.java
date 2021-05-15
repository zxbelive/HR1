package edu.hebeu.util;

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import edu.hebeu.entity.*;
import edu.hebeu.service.DepartmentService;
import edu.hebeu.service.EmployeeService;
import edu.hebeu.service.HistoryService;
import edu.hebeu.service.PositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class EmployeeListener extends AnalysisEventListener<employeeexcel> {
    private EmployeeService employeeService;
    private HistoryService historyService;
    private DepartmentService departmentService;
    private PositionService positionService;

    public  EmployeeListener(HistoryService historyService,EmployeeService employeeService,DepartmentService departmentService,PositionService positionService) {
        this.historyService = historyService;
        this.employeeService = employeeService;
        this.departmentService=departmentService;
        this.positionService=positionService;
    }


    public void invoke(employeeexcel employee, AnalysisContext analysisContext) {
//        List<Employee> employeeList=employeeService.selectall();
//        int i=0;
//        for (Employee employee1 : employeeList) {
//            if (employee.getName().equals(employee1.getName())){
//                i++;
//            }
//        }
//        if (i==0) {
        List<Employee> employeeList = employeeService.selectList(new EntityWrapper<Employee>().eq("name", employee.getName()));


        if (employeeList.isEmpty()){
        Employee employee1 = new Employee();
            List<History> eList = historyService.selectList(new EntityWrapper<History>()
                    .orderBy("employee_number", false));
            employee1.setEmployeeNumber(eList.get(0).getEmployeeNumber() + 1);
            employee1.setBirthday(employee.getBirthday());
            employee1.setPassword(employee.getPassword());
            List<Department> departments = departmentService.selectList(new EntityWrapper<Department>());
            Integer departmentnumber=0;
            for (Department department : departments) {
                if (department.getName().equals(employee.getDepartmentName())){
                    departmentnumber=department.getDepartmentNumber();
                    break;
                }
            }
            employee1.setDepartmentNumber(departmentnumber);
            employee1.setName(employee.getName());
            employee1.setGender(employee.getGender());
            employee1.setTelephone(employee.getTelephone());
            employee1.setEmail(employee.getEmail());
            employee1.setAddress(employee.getAddress());
            employee1.setEducation(employee.getEducation());
            employee1.setNotes(employee.getNotes());
            List<Position> positions = positionService.selectList(new EntityWrapper<Position>());
            Integer positionNunber=0;
            for (Position position : positions) {
                if (position.getName().equals(employee.getPositionName())){
                    positionNunber=position.getPositionNumber();
                    break;
                }
            }
            employee1.setPositionNumber(positionNunber);
            employeeService.addEmployee(employee1);
        }
        System.out.println(employee.toString());
    }

    public void doAfterAllAnalysed(AnalysisContext analysisContext) {
        System.out.println("doAfterAllAnalysed============");
    }
}
