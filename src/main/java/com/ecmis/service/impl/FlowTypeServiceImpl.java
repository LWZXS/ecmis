package com.ecmis.service.impl;

import com.ecmis.dao.flowtype.FlowTypeMapper;
import com.ecmis.pojo.FlowType;
import com.ecmis.service.FlowTypeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class FlowTypeServiceImpl implements FlowTypeService {

    @Resource
    private FlowTypeMapper flowTypeMapper;
    @Override
    public List<FlowType> findAll() {
        return flowTypeMapper.getAll();
    }

    @Override
    public FlowType findById(Integer flowTypeId) {
        return flowTypeMapper.getById(flowTypeId);
    }
}
