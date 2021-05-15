package edu.hebeu.service.impl;
import java.util.List;





import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import edu.hebeu.entity.Permis;
import edu.hebeu.entity.Role;
import edu.hebeu.mapper.PermisMapper;
import edu.hebeu.service.PermisService;





/**
 * @Title: 权限实现类
 * @author: Oldguo
 * @Desc:
 * @date: 2019年5月24日 下午4:42:36
 */
@Service("permisService")
public class PermisServiceImpl extends ServiceImpl<PermisMapper, Permis> implements PermisService{

	@Autowired
	private PermisMapper permismapper;
	
	/*
	 * 根据角色id取权限
	 * */
    public List<Permis> selectPermissionsByRoleId(Integer id) {        
		
    	List<Permis>  list = permismapper.selectPermissionsByRoleId(id);
    	return list;			
		
    }
     /*
      * 
      * 根据用户权限取权限
      * */
//    public List<Permis> selectPermissionsByUserCode(String userCode) {
//		return permismapper.selectPermissionsByUserCode(userCode);
//    }

    
}
