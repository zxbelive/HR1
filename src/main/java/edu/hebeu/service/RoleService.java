package edu.hebeu.service;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;

import edu.hebeu.entity.Role;


/**
 * @Title: 角色接口服务类
 * @author: Oldguo
 * @Desc:
 * @date: 2019年5月24日 下午3:28:36
 */
public interface RoleService extends IService<Role>{
	
	/**
     * 通过用户工号 查询用户 拥有的角色
     * 
     * @param usercode
     * @return
     */
    List<Role> selectRolesByUserCode(String userCode);
    //修改用户权限为ADMIN
    void updateroleadmin(Integer id);
    //修改用户权限为EMPLOYEE
    void updateroleemployee(Integer id);
    //修改用户权限为MANAGE
    void updaterolemanage(Integer id);
}
