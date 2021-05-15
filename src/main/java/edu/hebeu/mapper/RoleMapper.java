package edu.hebeu.mapper;
import java.util.List;

import com.baomidou.mybatisplus.mapper.BaseMapper;

import edu.hebeu.entity.Role;
public interface RoleMapper extends BaseMapper<Role>{
	 List<Role> selectRolesByUserCode(String userCode);

    void updateroleadmin(Integer id);

    void updateroleemployee(Integer id);

    void updaterolemanage(Integer id);

}
