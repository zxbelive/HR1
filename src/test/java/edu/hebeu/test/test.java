package edu.hebeu.test;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.read.builder.ExcelReaderBuilder;
import com.alibaba.excel.read.builder.ExcelReaderSheetBuilder;
import edu.hebeu.entity.Employee;
import edu.hebeu.entity.Salary;
import edu.hebeu.entity.Student;
import edu.hebeu.entity.employeeexcel;
import edu.hebeu.service.EmployeeService;
import edu.hebeu.util.MTimeUtil;
import edu.hebeu.util.StudentListener;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/spring.xml"})
public class test {
    @Autowired
    private EmployeeService employeeService;
    @Test
    public void test(){
        String format = MTimeUtil.dateFormat(new Date());
        System.out.println(format);
    }

    @Test
    public void te(){
        String s="iol";
        s.replace("iol","");
        System.out.println(s);
    }
//    @Test
//    public void t(){
//        String fileName = TestFileUtil.getPath() + "demo" + File.separator + "demo.xlsx";
//        // 这里 需要指定读用哪个class去读，然后读取第一个sheet 文件流会自动关闭
//        EasyExcel.read(fileName, DemoData.class, new DemoDataListener()).sheet().doRead();
//
//    }

    @Test
    public void testexcel(){
        EasyExcel.read("student.xlsx", Student.class, new StudentListener()).sheet().doRead();

    }

    @Test
    public void testwrite(){

        List<Employee> employeeList=employeeService.selectemployeeexcel();
        employeeexcel employeeexcel = new employeeexcel();
        List<employeeexcel> employeeexcels=new ArrayList<edu.hebeu.entity.employeeexcel>();
        for (Employee employee : employeeList) {
            employeeexcel.setName(employee.getName());
            employeeexcel.setAddress(employee.getAddress());
//            employeeexcel.setBirthday(employee.getBirthday());
            employeeexcel.setDepartmentName(employee.getDepartment().getName());
            employeeexcel.setPositionName(employee.getPosition().getName());
            employeeexcel.setEducation(employee.getEducation());
            employeeexcel.setEmail(employee.getEmail());
            employeeexcel.setTelephone(employee.getTelephone());
            employeeexcel.setPassword(employee.getPassword());
            employeeexcel.setGender(employee.getGender());
            employeeexcel.setNotes(employee.getNotes());
            employeeexcels.add(employeeexcel);
        }
        EasyExcel.write("emptest.xlsx", employeeexcel.class).sheet().doWrite(employeeexcels);

    }

    private static List<Student> intiData(){
        ArrayList<Student> students = new ArrayList<Student>();
        Student student = new Student();
        for (int i=0;i<10;i++){
            student.setName("zx"+i);
            student.setBirthday(new Date());
            student.setGender("男");
            students.add(student);
        }
        return students;

    }
    @Test
    public void t1(){
        System.out.println(intiData());
    }


}
