package edu.hebeu.security;

/**
 * @Title: 权限参数标识
 * @author: Oldguo
 * @Desc:
 * @date: 2019年5月28日 下午4:55:32
 */
public class PermissionSign {

	
	 /**
     * 部门查询 标识
     */
    public static final String DEPART_QUERY = "depart:query";
    
	 /**
     * 部门删除标识
     */
    public static final String DEPART_DEL = "depart:del";
	 /**
     * 部门更新展现标识
     */
    public static final String DEPART_UPDATE_SHOW = "depart:update:show";   
	 /**
     * 部门更新提交标识
     */
    public static final String DEPART_UPDATE_SUBMIT = "depart:update:submit";    

    
	 /**
     * 部门新增标识
     */
    public static final String DEPART_ADD_SHOW = "depart:add:show";  
	 /**
     * 部门新增提交标识
     */
    public static final String DEPART_ADD_SUBMIT = "depart:add:submit";  
    
	 /**
     * 职称查询标识
     */
    public static final String POSITION_QUERY = "position:query";      
    
 
	 /**
     * 请假列表标识
     */
    public static final String LEAVE_LIST = "leave:list";      
    
	 /**
     * 请假未批准列表标识
     */
    public static final String LEAVE_NOLIST = "leave:nolist";    
	 /**
     * 请假已批准列表标识
     */
    public static final String LEAVE_YESLIST = "leave:yeslist";     
	 /**
     * 请假更新标识
     */
    public static final String LEAVE_UPDATE = "leave:update";       
	 /**
     * 申请请假标识
     */
    public static final String LEAVE_ADD = "leave:add";      
    /**
     * 申请请假提交标识
     */
    public static final String LEAVE_NEW = "leave:new";
    
    /**
     *考勤管理列表标识
     */
    public static final String ATTENDANCE_LIST = "attendance:list";   
    
    /**
     *离退休员工列表标识
     */
    public static final String HISTORY_LIST = "history:list";   
    /**
     *离退休员工明细标识
     */
    public static final String HISTORY_DETAIL = "history:detail";  
    /**
     *离退休员工修改标识
     */
    public static final String HISTORY_UPDATE = "history:update";    
    /**
     *离退休员工修改提交标识
     */
    public static final String HISTORY_UPDATE_SUBMIT = "history:update:submit";     
    
    
    /**
     *员工档案列表标识
     */
    public static final String EMPLOYEE_LIST = "employee:list";    
    /**
     *员工调动记录列表标识
      */
    public static final String MOVE_LIST = "move:list";     
    
    /**
     *员工加班记录列表标识
      */
    public static final String OVERTIME_LIST = "overtime:list";  

    /**
     *员工新增加班记录标识
      */
    public static final String OVERTIME_ADD_SHOW = "overtime:add:show";  
    /**
     *员工新增加班提交标识
      */
    public static final String OVERTIME_ADD_SUBMIT = "overtime:add:submit";  
    /**
     *员工加班更新标识
      */
    public static final String OVERTIME_UPDATE_SHOW = "overtime:update:show";   
    /**
     *员工加班更新提交标识
      */
    public static final String OVERTIME_UPDATE_SUBMIT = "overtime:update:submit";  
    /**
     *员工加班删除标识
      */
    public static final String OVERTIME_DEL = "overtime:del";      
}
