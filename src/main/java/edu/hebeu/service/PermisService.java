package edu.hebeu.service;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;

import edu.hebeu.entity.Permis;


/**
 * @Title: 权限接口类
 * @author: Oldguo
 * @Desc:
 * @date: 2019年5月24日 下午4:39:40
 */
public interface PermisService extends IService<Permis>{

	List<Permis> selectPermissionsByRoleId(Integer id);
//	List<Permis> selectPermissionsByUserCode(String UserCode);
	
}
