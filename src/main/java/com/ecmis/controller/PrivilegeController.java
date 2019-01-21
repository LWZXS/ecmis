package com.ecmis.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.ecmis.pojo.MenuResource;
import com.ecmis.pojo.User;
import com.ecmis.service.MenuService;
import com.ecmis.service.PrivilegeService;
import com.ecmis.utils.CommonTreeBean;
import com.ecmis.utils.Constants;
import com.ecmis.utils.JsonUtil;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
@RequestMapping(value = "/privilege")
public class PrivilegeController {

    @Resource
    private PrivilegeService privilegeService;
    @Resource
    private MenuService menuService;
    @RequestMapping(value = "/list.json")
    @ResponseBody
    public String getMenuResource(@RequestParam(value = "masterId") Integer masterId,
                                  @RequestParam(value = "masterType") String masterType){

        //如果是用户的菜单,只查询用户的,不查他的角色的?
        //所有可用的菜单
        List<MenuResource> menus = menuService.findAdminLevel1Menus();
        //查询当用户/角色的资源
        List<MenuResource> menusByMaster =menuService.findMenusByMaster(masterId,masterType);
        List<CommonTreeBean> rootList=new ArrayList<CommonTreeBean>();

        for (MenuResource menu : menus) {
            CommonTreeBean tree=new CommonTreeBean(menu.getMenuId(), menu.getMenuName(), "close", null);
            Map<String,Object> attributesLevel1=new HashMap<String, Object>();
            attributesLevel1.put("url", menu.getUrl());
            attributesLevel1.put("icon", menu.getIcon());
            attributesLevel1.put("type", menu.getType());
            int checkedCount=0;
            for (MenuResource menuResource:menusByMaster){
                if (menu.equals(menuResource)){
                    attributesLevel1.put("checked",true);
                    checkedCount++;
                    break;
                }
            }
            if (menu.getType().equals("parent")){

                attributesLevel1.put("isParent","true");
            }

            tree.setAttributes(attributesLevel1);
            if(menu.getChildren()!=null){
                List<CommonTreeBean> children=new ArrayList<CommonTreeBean>();
                for (MenuResource childMenu : menu.getChildren()) {
                    CommonTreeBean childTree=new CommonTreeBean(childMenu.getMenuId(), childMenu.getMenuName(), "close", null);

                    Map<String,Object> attributesLevel2=new HashMap<String, Object>();
                    attributesLevel2.put("url", childMenu.getUrl());
                    attributesLevel2.put("icon", childMenu.getIcon());
                    attributesLevel2.put("type", childMenu.getType());
                    for (MenuResource menuResource:menusByMaster){
                        if (childMenu.equals(menuResource)){
                            childTree.setChecked(true);
                            break;
                        }
                    }
                    if (menu.getType().equals("parent")){
                        attributesLevel1.put("isParent","true");
                        if (childMenu.getChildren()!=null && childMenu.getChildren().size()>0){
                            List<CommonTreeBean> level3MenusTree=new ArrayList<CommonTreeBean>();
                            for (MenuResource level3Menu : childMenu.getChildren()) {
                                CommonTreeBean level3MenuTree = new CommonTreeBean(level3Menu.getMenuId(), level3Menu.getMenuName(), "close", null);
                                Map<String,Object> attributesLevel3=new HashMap<String, Object>();
                                attributesLevel3.put("url", level3Menu.getUrl());
                                attributesLevel3.put("icon", level3Menu.getIcon());
                                attributesLevel3.put("type", level3Menu.getType());
                                for (MenuResource menuResource:menusByMaster){
                                    if (level3Menu.equals(menuResource)){
                                        level3MenuTree.setChecked(true);
                                        break;
                                    }
                                }
                                level3MenuTree.setAttributes(attributesLevel3);
                                level3MenusTree.add(level3MenuTree);
                            }
                            childTree.setChildren(level3MenusTree);
                        }
                    }
                    childTree.setAttributes(attributesLevel2);
                    children.add(childTree);
                }
                tree.setChildren(children);
            }
            rootList.add(tree);
        }

        String json=JSON.toJSONString(rootList,SerializerFeature.DisableCircularReferenceDetect,
                SerializerFeature.WriteNullStringAsEmpty,SerializerFeature.WriteMapNullValue,
                SerializerFeature.WriteNullListAsEmpty,SerializerFeature.WriteNullBooleanAsFalse);
        return json;
    }

    @RequestMapping(value = "/index.html")
    public String index(){
        return "admin/privilege/index";
    }

    private Logger logger=Logger.getLogger(PrivilegeController.class);
    @RequestMapping(value = "/update.json")
    @ResponseBody
    public String update(@RequestParam(value = "masterId") Integer masterId,
                         @RequestParam(value = "masterType")String masterType,
                         @RequestParam(value = "resourceIds")Integer[] resourceIds,
                         @RequestParam(value = "resourceType")String resourceType, HttpSession session){
        User currentLoginUser = (User) session.getAttribute(Constants.LOGIN_USER);
        Map<String ,Object> map=new HashMap<>();
        if (currentLoginUser==null){
            map.put("result",false);
            map.put("message","您还没有登录,或登录信息过期,请先登录!");
            return JsonUtil.getJson(map);
        }
        logger.debug("gumy:"+"masterId:"+masterId+"-masterType:"+masterType+"---"+ Arrays.toString(resourceIds)+"-resourceType:"+resourceType);
        int count = privilegeService.insertPrivilege(currentLoginUser.getUserId(), masterId, masterType, resourceIds, resourceType);
        if (count>0){
            map.put("result",true);
            map.put("message","修改权限成功!");
        }else {
            map.put("result",false);
            map.put("message","修改权限失败!");
        }

        return JsonUtil.getJson(map);

    }
}
