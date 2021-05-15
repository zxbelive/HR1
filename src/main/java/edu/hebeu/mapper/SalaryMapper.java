package edu.hebeu.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import edu.hebeu.entity.Salary;

import java.util.List;

public interface SalaryMapper extends BaseMapper<Salary> {

    List<Salary> selectsalarylist(Page<Salary> page);

    Salary selectbyid(Integer id);
}
