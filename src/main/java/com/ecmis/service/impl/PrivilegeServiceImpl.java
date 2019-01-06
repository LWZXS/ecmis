package com.ecmis.service.impl;

import com.ecmis.dao.privilege.PrivilegeMapper;
import com.ecmis.service.PrivilegeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class PrivilegeServiceImpl implements PrivilegeService {
    @Resource
    private PrivilegeMapper privilegeMapper;
    @Override
    public int insertPrivilege(Integer creationUser, Integer masterId, String masterType, Integer[] resourceIds, String resourceType) {
        //先删除所有的权限
        int count= privilegeMapper.revokeFromMaster(creationUser,masterId,masterType);
        if (resourceIds!=null && resourceIds.length>0){
            count+=privilegeMapper.grantPrivilege(creationUser,masterId,masterType,resourceIds,resourceType);
        }
        return count;
    }

    @Override
    public int deleteFromMaster(Integer modifyUser, Integer masterId, String masterType) {
        return privilegeMapper.revokeFromMaster(modifyUser,masterId,masterType);
    }
}
