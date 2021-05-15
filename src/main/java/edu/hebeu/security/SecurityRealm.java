/**
 * 
 */
package edu.hebeu.security;

import java.util.List;

import edu.hebeu.service.impl.EmployeeServiceImpl;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;




import edu.hebeu.entity.Employee;
import edu.hebeu.entity.Permis;
import edu.hebeu.entity.Role;
import edu.hebeu.service.EmployeeService;
import edu.hebeu.service.PermisService;
import edu.hebeu.service.RoleService;

/**
 * 重写受权和认证
 * @author Oldguo
 * 
 *
 */
@Component(value = "securityRealm")
public class SecurityRealm extends AuthorizingRealm {

	
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private PermisService permisService;
	/*
	 * 权限
	 * */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		// TODO Auto-generated method stub
		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
		
		String userCode = String.valueOf(principals.getPrimaryPrincipal());
		//取用户角色
		
		final List<Role> roleInfos = roleService.selectRolesByUserCode(userCode);
		if (roleInfos!=null){
			for (Role role : roleInfos) {
	            // 添加角色
	            System.err.println("myrole=========>>>" + role);
	            authorizationInfo.addRole(role.getRole_sign());
	             //取权限
	            System.out.println(role.getId());
	            final List<Permis> permissions = permisService.selectPermissionsByRoleId(role.getId());
	            if (permissions!=null)
	            {
		            for (Permis permission : permissions) {
		                // 添加权限
		                System.err.println(permission);
						System.out.println(permission);
		                authorizationInfo.addStringPermission(permission.getPermission_sign());
		            }
	            }
	        }
		}	

		
		
		return authorizationInfo;
	}
	

	
	 /*
	  * 认证检验
	  */
	@Override	
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token) throws AuthenticationException {
		// TODO Auto-generated method stub
		
        String usercode = String.valueOf(token.getPrincipal());
        String password = new String((char[]) token.getCredentials());

		//Employee employee = employeeService.checkLogin( Integer.parseInt(usercode) ,password);
        Employee employee = employeeService.selectByNumber( Integer.parseInt(usercode));
		if (employee ==null){
        	// 抛出 帐号找不到异常
            throw new UnknownAccountException();
        }
		
		//数据为中如果为md5加密，则需要和配制文件中的<property name="hashAlgorithmName" value="md5" />规则保持一致
        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(usercode, employee.getPassword(), getName());
        return authenticationInfo;

	}

}
