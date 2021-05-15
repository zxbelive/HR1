package edu.hebeu.mapper;
import java.util.List;

import com.baomidou.mybatisplus.mapper.BaseMapper;

import edu.hebeu.entity.Permis;


public interface PermisMapper extends BaseMapper<Permis>{
	List<Permis> selectPermissionsByRoleId(Integer id);

//	List<Permis> selectPermissionsByUserCode(String userCode);
}
