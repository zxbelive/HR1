package edu.hebeu.entity;

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.write.style.ColumnWidth;

import java.util.Date;

public class employeeexcelcout {
    @ExcelProperty("姓名")
    private String name;
    @ExcelProperty("性别")
    private String gender;
    @ExcelProperty("出生日期")
    private Date birthday;
    @ExcelProperty("联系方式")
    @ColumnWidth(30)
    private String telephone;
    @ExcelProperty("邮箱")
    @ColumnWidth(60)
    private String email;
    @ExcelProperty("籍贯")
    private String address;
    @ExcelProperty("学历")
    private String education;
    @ExcelProperty("部门")
    private String departmentName;
    @ExcelProperty("职称")
    private String positionName;
    @ExcelProperty("备注")
    private String notes;

    public employeeexcelcout() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public String getPositionName() {
        return positionName;
    }

    public void setPositionName(String positionName) {
        this.positionName = positionName;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    @Override
    public String toString() {
        return "employeeexcel{" +
                "name='" + name + '\'' +
                ", gender='" + gender + '\'' +
                ", birthday=" + birthday +
                ", telephone='" + telephone + '\'' +
                ", email='" + email + '\'' +
                ", address='" + address + '\'' +
                ", education='" + education + '\'' +
                ", departmentName='" + departmentName + '\'' +
                ", positionName='" + positionName + '\'' +
                ", notes='" + notes + '\'' +
                '}';
    }
}
