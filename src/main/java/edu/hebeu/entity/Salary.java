package edu.hebeu.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;
import java.util.Date;

@TableName("salary")
public class Salary extends Model<Salary> implements Serializable {
    private static final long serialVersionUID = 1L;
    @TableId
    private Integer id;
    private Integer basicSalary;
    private Integer userCode;
    private Date inTime;
    private String notes;
    @TableField(exist=false)
    private Employee employee;
    @TableField(exist=false)
    private Department department;
    @TableField(exist=false)
    private Position position;

    public Position getPosition() {
        return position;
    }

    public void setPosition(Position position) {
        this.position = position;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getBasicSalary() {
        return basicSalary;
    }

    @Override
    public String toString() {
        return "Salary{" +
                "id=" + id +
                ", basicSalary=" + basicSalary +
                ", userCode=" + userCode +
                ", inTime=" + inTime +
                ", notes='" + notes + '\'' +
                ", employee=" + employee +
                ", department=" + department +
                ", position=" + position +
                '}';
    }

    public void setBasicSalary(Integer basicSalary) {
        this.basicSalary = basicSalary;
    }

    public Integer getUserCode() {
        return userCode;
    }

    public void setUserCode(Integer userCode) {
        this.userCode = userCode;
    }

    public Date getInTime() {
        return inTime;
    }

    public void setInTime(Date inTime) {
        this.inTime = inTime;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    protected Serializable pkVal() {
        return this.id;
    }

    public Salary() {
    }

}
