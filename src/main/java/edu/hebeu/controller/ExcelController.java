package edu.hebeu.controller;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.read.builder.ExcelReaderBuilder;
import com.alibaba.excel.read.builder.ExcelReaderSheetBuilder;
import com.alibaba.excel.write.style.column.LongestMatchColumnWidthStyleStrategy;
import edu.hebeu.entity.Employee;
import edu.hebeu.entity.Student;
import edu.hebeu.entity.employeeexcel;
import edu.hebeu.entity.employeeexcelcout;
import edu.hebeu.service.DepartmentService;
import edu.hebeu.service.EmployeeService;
import edu.hebeu.service.HistoryService;
import edu.hebeu.service.PositionService;
import edu.hebeu.util.EmployeeListener;
import edu.hebeu.util.MTimeUtil;
import org.apache.commons.io.FileUtils;
import org.aspectj.lang.annotation.After;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/excel")
public class ExcelController {
    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private HistoryService historyService;
    @Autowired
    private DepartmentService departmentService;
    @Autowired
    private PositionService positionService;

    @RequestMapping("/import.do")
    public String excelimport(@RequestParam MultipartFile multipartFile) throws IOException {
        EasyExcel.read(multipartFile.getInputStream(), employeeexcel.class,new EmployeeListener(historyService,employeeService,departmentService,positionService)).sheet().doRead();
        return "redirect:/employee/listPage.do?pageNo=1";
    }
    @RequestMapping("/export.do")
    public String excelexport(HttpServletResponse httpServletResponse) throws IOException {
        List<Employee> employeeList=employeeService.selectemployeeexcel();
        List<employeeexcelcout> employeeexcels=new ArrayList<edu.hebeu.entity.employeeexcelcout>();
        for (Employee employee : employeeList) {
            employeeexcelcout employeeexcel = new employeeexcelcout();
            employeeexcel.setName(employee.getName());
            employeeexcel.setAddress(employee.getAddress());
            String s = MTimeUtil.dateFormat(employee.getBirthday());
            employeeexcel.setBirthday(s);
            employeeexcel.setDepartmentName(employee.getDepartment().getName());
            employeeexcel.setPositionName(employee.getPosition().getName());
            employeeexcel.setEducation(employee.getEducation());
            employeeexcel.setEmail(employee.getEmail());
            employeeexcel.setTelephone(employee.getTelephone());
            employeeexcel.setGender(employee.getGender());
            employeeexcel.setNotes(employee.getNotes());
            System.out.println(employeeexcel);
            employeeexcels.add(employeeexcel);
        }
        ServletOutputStream outputStream = httpServletResponse.getOutputStream();
        String fileName= URLEncoder.encode("员工信息表", "UTF-8");;
        httpServletResponse.setContentType("application/vnd.ms-excel");
        httpServletResponse.setCharacterEncoding("utf-8");
        httpServletResponse.setHeader("Content-disposition", "attachment;filename=" + fileName + ".xlsx");
        EasyExcel.write(outputStream, employeeexcelcout.class).sheet()
                .registerWriteHandler(new LongestMatchColumnWidthStyleStrategy())
                .doWrite(employeeexcels);
        outputStream.flush();
        return "redirect:/employee/listPage.do?pageNo=1";
    }
}
