package edu.hebeu.controller;

import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.hebeu.entity.Move;
import edu.hebeu.security.PermissionSign;
import edu.hebeu.service.MoveService;

@Controller
@RequestMapping("/move")
public class MoveController {

	@Autowired
	private MoveService moveService;
	
	@RequestMapping("/list.do")
	@RequiresPermissions(value = PermissionSign.MOVE_LIST)
	public String selectList(Model model){
		List<Move> list = moveService.selectList();
		model.addAttribute("mList",list);
		return "admin/move_list";
	}
	
}
