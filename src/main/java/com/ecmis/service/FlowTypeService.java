package com.ecmis.service;

import com.ecmis.pojo.FlowType;

import java.util.List;

public interface FlowTypeService {
    List<FlowType> findAll();

    FlowType findById(Integer flowTypeId);
}
