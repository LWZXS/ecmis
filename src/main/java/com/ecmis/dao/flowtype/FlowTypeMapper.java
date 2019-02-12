package com.ecmis.dao.flowtype;

import com.ecmis.pojo.FlowType;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FlowTypeMapper {

    List<FlowType> getAll();

    FlowType getById(@Param("flowTypeId") Integer flowTypeId);
}
