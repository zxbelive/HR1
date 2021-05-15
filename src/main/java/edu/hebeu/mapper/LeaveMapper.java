package edu.hebeu.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;

import edu.hebeu.entity.Leave;
import edu.hebeu.entity.Role;
import edu.hebeu.entity.UserRole;

import java.util.List;

public interface LeaveMapper extends BaseMapper<Leave>{

    int selectrole(Integer empid);
}
