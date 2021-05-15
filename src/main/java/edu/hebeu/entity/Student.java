package edu.hebeu.entity;

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.write.style.ColumnWidth;
import javafx.scene.chart.PieChart;
import lombok.Data;

import java.util.Date;
@Data
public class Student {
    @ExcelProperty("学生姓名")
    private String name;
    @ExcelProperty("性别")
    private String gender;
    @ExcelProperty("生日")
    @ColumnWidth(20)
    private Date birthday;
    @ExcelProperty("ID")
    private String id;
}
