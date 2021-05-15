package edu.hebeu.entity;

import java.io.Serializable;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;


/**
 * 
 * @Title: 用户角色表
 * @author: Oldguo
 * @Desc:
 * @date: 2019年5月24日 下午2:47:43
 */
@TableName("tab_User_Role")
public class UserRole extends Model<UserRole> implements Serializable{
	private static final long serialVersionUID = 1L;
	@TableId
	private Integer id;
	private String  userCode;
	private Integer roleId;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}


	@Override
	protected Serializable pkVal() {
		// TODO Auto-generated method stub
		return this.id;
	}

}
