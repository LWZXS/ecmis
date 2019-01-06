package com.ecmis.service;

import org.apache.ibatis.annotations.Param;

public interface PrivilegeService {

    int insertPrivilege(Integer creationUser,Integer masterId,String masterType,
                       Integer[] resourceIds,String resourceType);

    int deleteFromMaster(Integer modifyUser,Integer masterId,String masterType);
}
